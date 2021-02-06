import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ['countConfirmed', 'countPending'];

  connect() {
    setInterval(this.refresh, 5000);
  }

  refresh = () => {
    console.log(typeof this.data.get('id'));
    fetch(`/equipment/${this.data.get('id')}/count_pending`, { headers: { accept: 'application/json' } })
      .then(response => response.json())
      .then((data) => {
        console.log(data);
      })
    // data.equipments.forEach((eq) => {
    //   if (eq.id === Number(this.data.get('id'))) {
    //     console.log(eq.id);
    //     this.countPendingTarget.innerText = eq.pending_equipment;
    //   }
    // });
    // console.log(data.equipments.keys);
    // console.log(this.data.get('id'));
    // data.equipments.key
    // this.countComfirmedTarget.innerText = data.restaurants.length;
    // this.countPendingTarget.innerText = data.equipments.;
    // });
  }
}
