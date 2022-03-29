window.addEventListener("load", function ()
{
  let counter = 0;

  function buttonClicked()
  {
    counter++;

    let clickCounterElement = document.getElementById("clickcounter");

    clickCounterElement.innerHTML = "Clicked " + counter + " times."
  }

  let clickButtonElement = document.getElementById("clickbutton");

  clickButtonElement.addEventListener("click", buttonClicked);
});