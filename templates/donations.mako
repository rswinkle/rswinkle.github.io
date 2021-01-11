<%inherit file="base.mako"/>
<%block name="title">
<title>Donate | Robert Winkler</title>
</%block>

<h1>Donation Methods</h1>
<p>
	I really appreciate any support since it allows me to devote more time to open source projects.
	There are lots of ways to support me listed below, even some that don't cost you any money.  Of course
	if you can't afford to donate, just using and sharing my software is great.  Thank you.
</p>

<h3>Subscriptions</h3>

<p>
<script src="https://liberapay.com/rswinkle/widgets/button.js"></script>
<noscript><a href="https://liberapay.com/rswinkle/donate"><img alt="Donate using Liberapay" src="https://liberapay.com/assets/widgets/donate.svg"></a></noscript>
</p>

##<p>
##<a href="https://liberapay.com/rswinkle/">Liberapay</a> is an open source subscription service similar to Patreon.
##</p>

##<p>
##<div id="paypal-button-container"></div>
##<script src="https://www.paypal.com/sdk/js?client-id=ARF0zni1tkT_aiYbcr7desjDoFpYnG8i6PfN6Fv63PvtCUYDU0e-TALzW-e3twI0WijBm1MUZHODBK7U&vault=true" data-sdk-integration-source="button-factory"></script>
##<script>
##	paypal.Buttons({
##			style: {
##					shape: 'pill',
##					color: 'gold',
##					layout: 'vertical',
##					label: 'subscribe',
##					
##			},
##			createSubscription: function(data, actions) {
##				return actions.subscription.create({
##					'plan_id': 'P-98U054389G672952WL3YRUAQ'
##				});
##			},
##			onApprove: function(data, actions) {
##				alert(data.subscriptionID);
##			}
##	}).render('#paypal-button-container');
##</script>
##</p>

##<p>
##<div id="paypal-button-container"></div>
##<script src="https://www.paypal.com/sdk/js?client-id=ARF0zni1tkT_aiYbcr7desjDoFpYnG8i6PfN6Fv63PvtCUYDU0e-TALzW-e3twI0WijBm1MUZHODBK7U&vault=true" data-sdk-integration-source="button-factory"></script>
##<script>
##	paypal.Buttons({
##			style: {
##					shape: 'pill',
##					color: 'gold',
##					layout: 'horizontal',
##					label: 'subscribe',
##					
##			},
##			createSubscription: function(data, actions) {
##				return actions.subscription.create({
##					'plan_id': 'P-98U054389G672952WL3YRUAQ'
##				});
##			},
##			onApprove: function(data, actions) {
##				alert(data.subscriptionID);
##			}
##	}).render('#paypal-button-container');
##</script>
##</p>



<h3>Cryptocurrency Methods</h3>

<p>
The first two buttons use Coinbase Merchant which (as of June 2020) supports BTC, BCH, DAI, ETH, LTC and USDC.
The only difference between the buttons is if you want to provide your email.  While I don't currently have
any reason for a mailing list, in the future if I started one (never more than once a month and likely less)
you would be automatically on it.  Of course, if I really had a serious need for one, I'd probably end up
using a service that streamlines the process anyway.  Update September 2020, for whatever reason the buttons
might not work the way they should (load forever in my browser), so I've included equivalent links below
(or just right click the buttons and open in new tab).
</p>

## Collects email
<p>
	<div>
		<a class="donate-with-crypto"
			href="https://commerce.coinbase.com/checkout/dc1ce380-fe61-44f0-8cc6-c54e414efd76">
			Donate with Crypto (requires email)
		</a>
		<script src="https://commerce.coinbase.com/v1/checkout.js?version=201807">
		</script>
	</div>
</p>

<p>
<a href="https://commerce.coinbase.com/checkout/dc1ce380-fe61-44f0-8cc6-c54e414efd76">With email</a>
</p>


## collects no info
<p>
	<div>
		<a class="donate-with-crypto"
		 	 href="https://commerce.coinbase.com/checkout/170324ef-fcf6-4dcc-91b9-8614cc0a3bb5">
			Donate with Crypto
		</a>
		<script src="https://commerce.coinbase.com/v1/checkout.js?version=201807">
		</script>
	</div>
</p>

<p>
<a href="https://commerce.coinbase.com/checkout/170324ef-fcf6-4dcc-91b9-8614cc0a3bb5">No email</a>
</p>


<p>
Here's a regular address that I use</p>
    <div class="blockchain stage-ready">
         <p align="center">Please Donate To Bitcoin Address: <b>1LmRgWJfhiYVf3oXfFZC4wtBrHbHLiVqVP</b></p>
         <p align="center" class="qr-code"><img style="margin:5px" src="https://blockchain.info/qr?data=1LmRgWJfhiYVf3oXfFZC4wtBrHbHLiVqVP&size=200">
    </div>
</p>


<h3>Other Payment methods</h3>

<ul>
	<li>
		<form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
		<input type="hidden" name="cmd" value="_s-xclick">
		<input type="hidden" name="hosted_button_id" value="HSLTJ5L2RPEXY">
		<input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
		<img alt="" border="0" 
		src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" width="1" 
		height="1">
		</form>
	</li>
	<li>
		<a href="https://www.paypal.me/RobertWinklerCoder">Paypal.me link</a>
	</li>
	<br/>

	##<li>
	##<script id='fbjvaj1'>(function(i){var f,s=document.getElementById(i);f=document.createElement('iframe');f.src='//button.flattr.com/view/?fid=g3ejo0&url='+encodeURIComponent(document.URL);f.title='Flattr';f.height=62;f.width=55;f.style.borderWidth=0;s.parentNode.insertBefore(f,s);})('fbjvaj1');</script>
	##</li>
</ul>

<h3>Free Methods (affiliate and referral links)</h3>
<ul>
	<li>
		If you use the <a href="https://brave.com/">Brave</a> you can support me with BAT tips.
	</li>
	<li>
		Get $50 of free tutoring by signing up via my <a href="http://www.wyzant.com/tutorrobert">Wyzant referral link</a>.
		You can get more details at the link or from <a href="/images/flyer.pdf">here</a>
	</li>
</ul>


