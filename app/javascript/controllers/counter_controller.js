import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ['countConfirmed', 'countPending'];

  connect() {
    setInterval(this.refresh, 5000);
  }

  refresh = () => {
    // console.log(typeof this.data.get('id'));
    fetch(`/equipment/${this.data.get('id')}/count_status`, { headers: { accept: 'application/json' } })
      .then(response => response.json())
      .then((data) => {
        this.countPendingTarget.innerText = data.pending_equipment.length;
        this.countConfirmedTarget.innerText = data.confirmed_equipment.length;
      });
  }
}
