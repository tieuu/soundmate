const changeStatusColor = () => {
  const allStatus = document.querySelectorAll('.status');
  allStatus.forEach((status) => {
    switch (status.innerText.toLowerCase()) {
      case 'pending':
        status.classList.add('text-warning', 'font-weight-bold');
        break;
      case 'confirmed':
        status.classList.add('text-success', 'font-weight-bold');
        break;
      case 'cancelled':
        status.classList.add('text-danger', 'font-weight-bold');
        break;
      default:
        status.classList.add('text-muted', 'font-weight-bold');
    }
  })
};

export { changeStatusColor };
