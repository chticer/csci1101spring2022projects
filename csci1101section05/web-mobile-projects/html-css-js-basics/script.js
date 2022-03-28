window.addEventListener("load", function ()
{
  let counter = 0;

  function buttonClicked()
  {
    counter++;

    let clickedCounterElement = document.getElementById("clickcounter");

    clickedCounterElement.innerHTML = "Clicked " + counter + " times."
  }

  let clickedButtonElement = document.getElementById("clickbutton");

  clickedButtonElement.addEventListener("click", buttonClicked);
});