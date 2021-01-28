const changeColor = () => {
const banner = querySelector(".banner")

   let hue = 0;
    function changeBg() {
      if (hue >= 360) hue = 0;
      banner.style.backgroundColor = "hsl(" + hue + ",80%,50%)";
      hue += 1;
      setTimeout(() => { changeBg() }, 150);
    };
    changeBg();
}
export { changeColor };
