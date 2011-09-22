var numIsEven = function(n) {
  return (n % 2 === 0) ? true : false;
};

$(document).ready(function() {
  $('article').each(function() {
    if (numIsEven(this.attr('id'))) {
      $(this).addClass('zebra');
    }
  });
});
