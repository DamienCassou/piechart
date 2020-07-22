const readline = require("readline");
const ChartjsNode = require("chartjs-node");
const randomColor = require('randomcolor');

const devicePixelRatio = 5;

const generateChart = ({ data, dimension, filename }) => {
  var chartNode = new ChartjsNode(dimension, dimension);

  return chartNode.drawChart(pieChartOptions({ data })).then(() => {
    return chartNode.writeImageToFile("image/png", filename);
  });
};

const pieChartOptions = ({ data }) => {
  const labels = data.map(pair => `${pair[1]} (${pair[0]})`);
  const values = data.map(pair => pair[0]);

  return {
    type: "doughnut",
    data: {
      datasets: [
        {
          data: values,
          backgroundColor: randomColor({count: labels.length, luminosity: 'dark'})
        }
      ],
      labels,
      borderWidth: 0
    },
    options: {
      devicePixelRatio
    }
  };
};

const readData = () => {
  return new Promise(resolve => {
    const reader = readline.createInterface({
      input: process.stdin
    });

    var lines = [];

    reader.on("line", line => {
      line = line.trim();

      if (line) lines.push(line.split(";"));
    });

    reader.on("close", () => {
      resolve(lines);
    });
  });
};

const main = async () => {
  const data = await readData();

  const filename = process.argv[2];

  if (!filename) {
    throw new Error("Missing filename as parameter");
  }

  generateChart({
    data,
    filename,
    dimension: 500
  });
};

main()
  .then()
  .catch(err => {
    throw err;
  });
