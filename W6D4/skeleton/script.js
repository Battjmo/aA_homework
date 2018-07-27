document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });


document.addEventListener("submit", event => {
  event.preventDefault();

  const placeNameInput = document.querySelector(".favorite-input");

  const placeName = placeNameInput.value;
  console.log(placeNameInput.value);
  placeNameInput.value = "";

  const ul = document.getElementById("sf-places");
  const li = document.createElement("li");
  li.textContent = placeName;

  ul.appendChild(li);
});

const showPhotoForm = (e) => {
  const photoForm = document.querySelector(".photo-form-container");
  if (photoForm.className === 'photo-form-container') {
    photoForm.className = 'photo-form-container hidden';
  } else {
    photoForm.className = 'photo-form-container';
  }
};

const photoButton = document.querySelector(".photo-show-button");
photoButton.addEventListener("click", showPhotoForm);





});
