import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["display", "startStop", "pauseResume"];

    initialize() {
        this.timer = null;
        this.running = false;
        this.time = 0;
    }

    startStop() {
      this.running = !this.running;
        if (this.running) {
            this.timer = setInterval(() => this.updateDisplay(++this.time), 1000);
            this.startStopTarget.textContent = "🛑";
            this.pauseResumeTarget.disabled = false;
        } else {
            clearInterval(this.timer);
            this.running = false;
            this.startStopTarget.textContent = "▶️";
        }
    }

    reset() {
        clearInterval(this.timer);
        this.running = false;
        this.time = 0;
        this.updateDisplay(this.time);
    }

    pauseResume() {
        if (this.running) {
            clearInterval(this.timer);
            this.running = false;
            this.pauseResumeTarget.textContent = "▶️";
        } else {
            this.timer = setInterval(() => this.updateDisplay(++this.time), 1000);
            this.running = true;
            this.pauseResumeTarget.textContent = "⏸️";
        }
    }

    updateDisplay(time) {
        const h = Math.floor(time / 3600),
              m = Math.floor((time % 3600) / 60),
              s = time % 60;
        this.displayTarget.textContent = `${String(h).padStart(2, '0')}:${String(m).padStart(2, '0')}:${String(s).padStart(2, '0')}`;
    }
}
