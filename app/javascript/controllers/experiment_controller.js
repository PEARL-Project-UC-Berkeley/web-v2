import { Controller } from "@hotwired/stimulus";
import consumer from "channels/consumer";

export default class extends Controller {
  static targets = ["field"];
  static values = { id: Number };

  connect() {
    this.subscription = consumer.subscriptions.create(
      { channel: "ExperimentChannel", experiment: this.idValue },
      {
        received(data) {
          const target = document.getElementsByName(data.control)[0];
          if (target) {
            target.value = data.value;
            target.checked = data.value;
          }
        },
      }
    );

    this.fieldTargets.forEach((field) => {
      field.addEventListener("change", e => {
        const control = e.target.name;
        let value = e.target.value;
        if(e.target.type == "checkbox"){
          value = e.target.checked
        }
        this.sendUpdate(control, value);
      });
    });
  }

  disconnect() {
    if (this.subscription) {
      this.subscription.unsubscribe();
    }
  }

  findTarget(name) {
    return this.fieldTargets.find((target) => target.name === name);
  }

  sendUpdate(control, value) {
    this.subscription.send({
      experiment: this.idValue,
      control,
      value,
    });
  }
}
