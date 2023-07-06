
<div class="container-fluid bg-grey">

	<div class="row" style="font-family: serif; font-size: 150%;">

		<div class="col-sm-3">

			<p>About Us</p>
			<p>Terms &amp; Conditions</p>
			<p>Privacy Policy</p>
			<p>Rooms</p>

		</div>

		<div class="col-sm-3">

			<p>The Rooms &amp; Suites</p>
			<p>About Us</p>
			<p>Contact Us</p>
			<p>Services</p>

		</div>

		<div class="col-sm-3">
			<p>
				<span class="d-block"><span
					class="glyphicon glyphicon-map-marker" style="margin-right: 5px;"> </span>Address:</span> <span>
					123 Go to sky, <br> Da Nang, VN
				</span>
			</p>

			<p>
				<span class="d-block"><span class="fas fa-phone" style="margin-right: 5px;"> </span>Phone:</span>
				<span> (+83) 123 1234 12</span>
			</p>

			<p>
				<span class="d-block"><span class="fas fa-envelope" style="margin-right: 5px;"> </span>Email:</span>
				<span> myEmail@gmail.com</span>
			</p>

		</div>

		<div class="col-sm-3">
			<p>Sign up for our newsletter</p>
			<form action="#" class="footer-newsletter">
				<div class="form-group">
					<input type="email" class="form-control" placeholder="Email..."
						readonly>
				</div>
				<i class="fas fa-paper-plane"></i>
			</form>
			

		</div>
	</div>
</div>
<footer class="panelfooter container-fluid2 bg-black text-center">
	<a href="#myPage" title="To Top"> <span
		class="glyphicon glyphicon-chevron-up"></span>
	</a>
	<p style="color: white;">
		Copyright by <a href="home.jsp">H.G.R Resort</a>
	</p>
</footer>

<script>
$(document).ready(function(){
  // Add smooth scrolling to all links in navbar + footer link
  $(".navbar a, footer a[href='#myPage']").on('click', function(event) {

   // Make sure this.hash has a value before overriding default behavior
  if (this.hash !== "") {

    // Prevent default anchor click behavior
    event.preventDefault();

    // Store hash
    var hash = this.hash;

    // Using jQuery's animate() method to add smooth page scroll
    // The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
    $('html, body').animate({
      scrollTop: $(hash).offset().top
    }, 900, function(){

      // Add hash (#) to URL when done scrolling (default click behavior)
      window.location.hash = hash;
      });
    } // End if
  });
})
</script>


<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
	
	