//FUNCTION 1: HAMMER TIME

window.setTimeout(function () {
  alert('HAMMER TIME!');
}, 5000);

//FUNCTION 2: CUSTOMIZABLE HAMMER TIME

function hammerTime (time) {
  window.setTimeout(function () {
    alert(`${time} is HAMMER TIME!`);
  });
}
