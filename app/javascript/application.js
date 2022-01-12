// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"
import Webcam from "webcam-easy"

document.addEventListener("turbo:load", () => {
  var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
  var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
    return new bootstrap.Tooltip(tooltipTriggerEl)
  })
})


document.addEventListener("turbo:load", () => {
  var webcamElement = document.getElementById('webcam')
  var canvasElement = document.getElementById('canvas')
  var snapSoundElement = document.getElementById('snapSound')
  const webcam = new Webcam(webcamElement, 'user', canvasElement, snapSoundElement)
})



