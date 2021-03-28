function pullDown() {

  const pullDownButtonLady = document.getElementById("lady")
  const pullDownParentsLady = document.getElementById("lady_down")
  const pullDownButtonMen = document.getElementById("men")
  const pullDownParentsMen = document.getElementById("men_down")
  const pullDownButton = document.getElementById("lists")
  const pullDownParents = document.getElementById("pull_down")

  pullDownButtonLady.addEventListener('mouseover', function() {
    pullDownParentsLady.setAttribute("style", "display:block;")
  })

  pullDownButtonLady.addEventListener('mouseout', function(){
    pullDownParentsLady.removeAttribute("style", "display:block;")
  })

  pullDownButtonMen.addEventListener('mouseover', function() {
    pullDownParentsMen.setAttribute("style", "display:block;")
  })

  pullDownButtonMen.addEventListener('mouseout', function(){
    pullDownParentsMen.removeAttribute("style", "display:block;")
  })

  pullDownButton.addEventListener('mouseover', function() {
    pullDownParents.setAttribute("style", "display:block;")
  })

  pullDownButton.addEventListener('mouseout', function(){
  pullDownParents.removeAttribute("style", "display:block;")
  })
}

window.addEventListener('load', pullDown)