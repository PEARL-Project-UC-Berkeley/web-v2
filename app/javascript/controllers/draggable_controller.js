import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["draggable"];
  static values = { scale: Number };

  connect() {
    this.scaleValue = this.hasScaleValue ? this.scaleValue : 1;
    this.updateTransform();
  }

  updateTransform() {
    this.draggableTarget.style.transform = `scale(${this.scaleValue})`;
  }

  drag(event) {
    event.preventDefault();
    const draggable = this.draggableTarget;
    const offsetX = event.clientX - draggable.offsetLeft;
    const offsetY = event.clientY - draggable.offsetTop;

    const moveHandler = (e) => {
      const x = e.clientX - offsetX;
      const y = e.clientY - offsetY;
      draggable.style.left = x + "px";
      draggable.style.top = y + "px";
    };

    const releaseHandler = () => {
      window.removeEventListener("mousemove", moveHandler);
      window.removeEventListener("mouseup", releaseHandler);
    };

    window.addEventListener("mousemove", moveHandler);
    window.addEventListener("mouseup", releaseHandler);
  }

  scale(event) {
    event.preventDefault();
    const delta = event.deltaY > 0 ? -0.1 : 0.1;
    this.scaleValue += delta;
    this.updateTransform();
  }
}
