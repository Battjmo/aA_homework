//FUNCTION 3: COFFEE AND SCONES

const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function coffeeAndScones () {
  reader.question('Would you like some coffee?', function (res) {
    console.log(`You said ${res}.`);
    reader.question('Would you like some tasty scones?', function (res2) {
      console.log(`You said ${res2}.`);

      const first = (res === 'yes') ? 'do' : 'don\'t';
      const second = (res2 === 'yes') ? 'do' : 'don\'t';

      console.log(`So you ${first} want coffee and ${second} want scones.`);
      reader.close();
    });
  });
}
