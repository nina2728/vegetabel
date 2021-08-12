window.addEventListener('load', function(){

  const pullDownButton = document.getElementById("pulldown")
  
  pullDownButton.addEventListener('mouseover', function(){
  })

  pullDownButton.addEventListener('mouseout', function(){
    console.log("mouseout OK")
  })

  pullDownButton.addEventListener('click', function() {
    console.log("click OK")
  })
})