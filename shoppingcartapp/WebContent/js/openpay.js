console.log('hi');
console.log(JamAuthToken);

var middlewareHost = 'pysdk.openpaysdk.com';
var authPayload = { "token": { JamAuthToken, "openpay_url_mode": "Training" } };
var openpayImgPath = 'https://www.jssdk.openpaytestandtrain.com.au/cdn/img';
var openpayLogoPath = 'https://www.jssdk.openpaytestandtrain.com.au/cdn/img/op-logos';
var activateMiniCart = true;
var activateProductList = true;
var checkoutSettingsExists = true;
if (typeof (miniCartClasses) === 'undefined') {
  activateMiniCart = false;
}

if (typeof (productListClasses) === 'undefined') {
  activateProductList = false;
}

if (typeof (checkoutSettings) === 'undefined') {
  checkoutSettingsExists = false;
}


fetch(`https://${middlewareHost}/api/auth/`, {
  method: 'POST',
  headers: {
    'Content-type': 'application/json'
  },
  mode: 'cors',
  body: JSON.stringify(authPayload)
}).then((response) => {
  if (response.ok) {
    return response.json();
  } else {
    throw new Error("Could not reach the API: " + response.statusText);
  }
}).then((data) => {
  activatePlugin();
}).catch((error) => {
  // 	console.log(error);
});

/*close the bar*/
var closeBanner = () => {
  document.getElementById('notification-bar').style.display = 'none';
}
var myOpen = () => {
  document.getElementById("openpayPopbox").style.display = "block";
}
var myClose = () => {
  document.getElementById("openpayPopbox").style.display = "none";
}
var priceOpen = () => {
  document.getElementById("pricepopbox").style.display = "block";
}
var priceClose = () => {
  document.getElementById("pricepopbox").style.display = "none";
}

const activatePlugin = () => {

  //   const getLogo(logo)


  const showNotificationBar = (contents) => {
    var closeButtonText = contents.closeButtonText;
    closeButtonText = typeof closeButtonText !== 'undefined' ? closeButtonText : 'Close';
    const notification = document.getElementById('notification-bar');
    if (!notification) {
      // let body = document.getElementsByTagName("BODY")[0];
      var closeButton = "<a id ='close' onclick='closeBanner();' href='javascript:void(0)' class='notification__close' style='float: right;' >" + closeButtonText + "</a>";
      var messages = '';
      for (content of contents.messages) {
        let bgColor = content.bgColor;
        let txtColor = content.txtColor;
        let height = content.height;
        let message = content.message;
        let closeButtonText = content.closeButtonText;
        let infoButtonText = content.infoButtonText;
        let logo = content.logo;
        console.log(logo);
        bgColor = typeof bgColor !== 'undefined' ? bgColor : "#cccccc";
        txtColor = typeof txtColor !== 'undefined' ? txtColor : "#000000";
        height = typeof height !== 'undefined' ? height : 40;
        message = typeof message !== 'undefined' ? message : 'Please Provide a Message';
        infoButtonText = typeof infoButtonText !== 'undefined' ? infoButtonText : 'Learn More';
        if (logo === 'op_text_blue') {
          messages += ` 
          <div class="notification__cover opSlides op-animate-top" style="background-color: ${bgColor}; height: 400">
            <div class="notifi__inner">
              <div class="notification__logo" style="color:#2864ff !important;">Openpay</div>
              <p style="color: ${txtColor}">${message}</p>
              <a href="javascript:void(0);" onclick="myOpen()">${infoButtonText}</a>
              
            </div>
          </div>`
        } else if (logo === 'op_text_black') {
          messages += ` 
          <div class="notification__cover opSlides op-animate-top" style="background-color: ${bgColor}; height: 400">
            <div class="notifi__inner">
            <div class="notification__logo" style="color:#000000 !important;">Openpay</div>
              <p style="color: ${txtColor}">${message}</p>
              <a href="javascript:void(0);" onclick="myOpen()">${infoButtonText}</a>
              
            </div>
          </div>`
        } else {
          messages += ` 
          <div class="notification__cover opSlides op-animate-top" style="background-color: ${bgColor}; height: 400">
            <div class="notifi__inner">
              <div class="notification__logo"><img src="${openpayLogoPath}/${logo}.png" alt="Openpay"></div>
              <p style="color: ${txtColor}">${message}</p>
              <a href="javascript:void(0);" onclick="myOpen()">${infoButtonText}</a>
              
            </div>
          </div>`
        }
      }


      var popupUpHtml = `<div class="openpayPopbox" id="openpayPopbox">
			<div class="popboxContent">
				<div class="innerClassPopbox">
					<a href="javascript:void(0);" class="popboxClose" onclick="myClose();"></a>
					<div class="popboxDivContent">
						<a href="javascript:void(0)" class="popboLogo"><img src="${openpayImgPath}/logo-4.png" alt=""></a>
						<p>Openpay is a simple and flexible way to buy now <br>and pay later - with zero interest. We offer longer, more flexible terms all easily <br>managed through the Openpay App.</p>
						<div class="popboxMainFeature">
							<h4>Buy with Openpay in 3 easy steps:</h4>
							<ul class="op-step-sec">
								<li>
									<div class="inner">
										<div class="op-step">
											<div class="op-step-inner">
												<span>1</span>
											</div>
										</div>
										<p>Shop &amp; <br>checkout</p>
									</div>
								</li>
								<li>
									<div class="inner">
										<div class="op-step">
											<div class="op-step-inner">
												<span>2</span>
											</div>
										</div>
										<p>Select Openpay from payment options</p>
									</div>
								</li>
								<li>
									<div class="inner">
										<div class="op-step">
											<div class="op-step-inner">
												<span>3</span>
											</div>
										</div>
										<p>Register &amp; design your plan</p>
									</div>
								</li>
							</ul>

							<p>If you are 18 years or older and a permanent resident of Australia all you’ll need is:</p>
							<ul class="enquery">
								<li>Photo ID</li>
								<li>Debit or Credit Card</li>
								<li>Email</li>
								<li>The required deposit</li>
								<li>Mobile phone (+ another contact number)</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>`;
      var HTMLmessage = `<div class="notification__message">
				${messages}
				${closeButton}
			</div>
			${popupUpHtml}`;
      // body.innerHTML = "<div id='notification-bar' class = 'notification__bar'>" + HTMLmessage + "</div>" + body.innerHTML;
      const newDivBody = document.body.firstChild;
      console.log(newDivBody);
      const noti_div = document.createElement('DIV');
      noti_div.innerHTML = "<div id='notification-bar' class = 'notification__bar'>" + HTMLmessage + "</div>";
      document.body.insertBefore(noti_div, newDivBody);

      var myIndex = 0;
      function notificationSlider() {
        var i;
        var x = document.getElementsByClassName("opSlides");
        for (i = 0; i < x.length; i++) {
          x[i].style.display = "none";
        }
        myIndex++;
        if (myIndex > x.length) {
          myIndex = 1
        }
        x[myIndex - 1].style.display = "block";
        setTimeout(notificationSlider, 5000);
      }
      notificationSlider();
    }
  }

  const removeElements = (elms) => [...elms].forEach(el => el.remove());

  const openpayCalculatorAPI = (amount, i) => {
    const data = {
      "token": {
        "JamAuthToken": ProductListOpenpayInfo.authToken,
        "openpay_url_mode": "Training"
      },
      "purchase_price": amount,
      "duration": ProductListOpenpayInfo.payOfMonth + ' Month',
      "payment_frequency": ProductListOpenpayInfo.frequency
    };
    console.log(data);
    fetch(`https://${middlewareHost}/api/price_calculator/`, {
      method: 'POST',
      headers: {
        'Content-type': 'application/json'
      },
      mode: 'cors',
      body: JSON.stringify(data)
    }).then((response) => {
      if (response.ok) {
        return response.json();
      } else {
        throw new Error("Could not reach the API: " + response.statusText);
      }
    }).then((response) => {
      const filteredData = response.filtered_scheme;
      const initialAmounts = document.querySelectorAll(`#todayAmt${i}`);
      const logo = ProductListOpenpayInfo.logo;
      var logoHTML = ``;
      if (logo === 'op_text_blue') {
        logoHTML = `<div style="position: relative; top: 2px; margin: 0px 4px;color:#2864ff;">Openpay</div>`
      } else if (logo === 'op_text_black') {
        logoHTML = `<div style="position: relative; top: 2px; margin: 0px 4px;color:#000000;">Openpay</div>`
      } else {
        logoHTML = `<img src="${openpayLogoPath}/${ProductListOpenpayInfo.logo}.png" style="position: relative; top: 2px; margin: 0px 4px;">`;
      }
      if (filteredData) {
        const initialPrice = filteredData[0].initial_payment;
        const paymentAmount = filteredData[0].payment_amount;
        const payments = filteredData[0].no_of_payments;
        const textFormat = ProductListOpenpayInfo.text;
        console.log(textFormat);
        // const isFractional = response.fractional_payment;
        // if (isFractional) {
        if (textFormat === 'normal') {
          for (initialAmount of initialAmounts) {
            initialAmount.innerHTML = `Or $${initialPrice} today and more time to pay with ${logoHTML}`;
          }
        }
        if (textFormat === 'fractional') {
          for (initialAmount of initialAmounts) {
            initialAmount.innerHTML = `Or ${payments + 1} payments of $${initialPrice} with ${logoHTML}`;
          }
        }
        if (textFormat === 'noprice') {
          for (initialAmount of initialAmounts) {
            initialAmount.innerHTML = `Or more time to pay with ${logoHTML}`;
          }
        }
        // }
        // else {
        //   if (textFormat === 'format1') {
        //     for (initialAmount of initialAmounts) {
        //       initialAmount.innerText = `Or $${initialPrice} today and more time to pay with `;
        //     }
        //   }
        //   if (textFormat === 'format2') {
        //     for (initialAmount of initialAmounts) {
        //       // initialAmount.innerText = `Or $${initialPrice} today and rest with ${payments + 1} payments of $${paymentAmount} with `;
        //       initialAmount.innerText = `Or ${payments + 1} payments of $${initialPrice} with `;
        //     }
        //   }
        //   if (textFormat === 'format3') {
        //     for (initialAmount of initialAmounts) {
        //       initialAmount.innerText = `Or more time to pay with `;
        //     }
        //   }
        // }
      } else {
        for (initialAmount of initialAmounts) {
          initialAmount.innerHTML = `Or more time to pay with ${logoHTML}`;
        }
      }
    }).catch((error) => {
      console.log(error);
    });
  }



  fetch(`https://${middlewareHost}/api/min-max-dummy/`, {
    method: 'POST',
    headers: {
      'Content-type': 'application/json'
    },
    mode: 'cors',
    body: JSON.stringify(authPayload)
  }).then((response) => {
    if (response.ok) {
      return response.json();
    } else {
      throw new Error("Could not reach the API: " + response.statusText);
    }
  }).then((data) => {
    const minPrice = data.MinPrice;
    const maxPrice = data.MaxPrice;
    if (activateProductList) {
      addLogoToList(minPrice, maxPrice);
    }
    console.log(activateMiniCart)
    if (activateMiniCart) {
      console.log(activateMiniCart)
      miniCartWidget(minPrice, maxPrice);
    }
    // addCheckoutWidget(minPrice, maxPrice);
  }).catch((error) => {
    console.log(error);
  });


  const infoDivExists = document.querySelectorAll('.top-info');
  removeElements(infoDivExists)
  const addLogoToList = (min, max) => {

    const removeElementsss = (elms) => [...elms].forEach(el => el.remove());
    const infoDivExists = document.querySelectorAll('.top-info');
    removeElementsss(infoDivExists)
    var prices = document.querySelectorAll(productListClasses.productParentPrice);
    if (!prices.length) {
      prices = document.querySelectorAll(productListClasses.productAlternatePrice);
    }
    for ([i, price] of prices.entries()) {
      // if (price.nextSibling.className !== 'top-info') {
      const widgitHTML = `<div class="info-ttl">
                            <span class="" id="todayAmt${i}"></span>
                            <div class="price__Info">
                              <a onclick = "priceOpen();">Learn More</a>
                            </div>
                          </div>
                          <div class="pricepopbox" id="pricepopbox">
                            <div class="popboxPriceContent">
                              <div class="innerPricePopbox">
                                <a href="javascript:void(0);" class="popboxClose" onclick="priceClose()"></a>
                                <div class="popboxPriceInner">
                                  <div class="popUpperpart">
                                    <div class="allLogos">
                                      <span>Merchant</span>
                                      <span><img src="${openpayImgPath}/icon-openpay.png"></span>
                                    </div>
                                    <h6>Buy now. Pay smarter</h6>
                                  </div>
                                  <div class="popLowerpart">
                                    <h4>Available on orders from $${min} - $${max}</h4>
                                    <ul>
                                      <li>
                                        <span></span>
                                        <p>Shop & <br>checkout</p>
                                      </li>
                                      <li>
                                        <span></span>
                                        <p>Select Openpay as <br>your payment method</p>
                                      </li>
                                      <li>
                                        <span></span>
                                        <p>Register & design <br>your plan</p>
                                      </li>
                                    </ul>
                                  </div>
                                  <div class="popLastPart">
                                    <p>If you are 18 years or older and a permanent resident of Australia all you’ll need is a </p>
                                    <div class="innerElements">
                                      <span>Debit or Credit card</span>
                                      <span>Email address</span>
                                      <span>The required deposit</span>
                                      <span>Mobile phone</span>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>`;


      let amounts = price.innerText;
      amounts = amounts.replace(/\n/g, " ").split(" ");
      amounts = amounts.map(amount => Number(amount.replace(/[^0-9.-]+/g, "")));
      amounts = amounts.filter(amount => amount !== 0);
      amounts = amounts.sort();
      const divNode = document.createElement('DIV');
      const spanNode = document.createElement('SPAN');
      const topInfoDiv = divNode;
      topInfoDiv.classList.add('top-info');
      topInfoDiv.innerHTML = widgitHTML;
      topInfoDiv.style.color = ProductListOpenpayInfo.styles.color;
      topInfoDiv.style.fontStyle = ProductListOpenpayInfo.styles.fontStyle;
      topInfoDiv.style.fontSize = ProductListOpenpayInfo.styles.fontSize;
      topInfoDiv.style.fontWeight = ProductListOpenpayInfo.styles.fontWeight;
      topInfoDiv.style.fontFamily = ProductListOpenpayInfo.styles.fontFamily;
      topInfoDiv.style.top = ProductListOpenpayInfo.styles.top;
      topInfoDiv.style.bottom = ProductListOpenpayInfo.styles.bottom;
      topInfoDiv.style.left = ProductListOpenpayInfo.styles.left;
      topInfoDiv.style.right = ProductListOpenpayInfo.styles.right;
      if (amounts[0] > min && amounts[0] < max) {
        price.after(topInfoDiv);
        openpayCalculatorAPI(amounts[0], i);
      }
      // }

    }



  };

  const miniCartWidget = (min, max) => {
    console.log('hi');
    const cartParent = document.querySelector(miniCartClasses.cartParent);
    const cartContent = document.querySelector(miniCartClasses.cartContent);
    const logo = miniCartSettings.logo;
    var logoHTML = ``;
    if (logo === 'op_text_blue') {
      logoHTML = `<div style="color:#2864ff;">Openpay</div>`
    } else if (logo === 'op_text_black') {
      logoHTML = `<div style="color:#000000;">Openpay</div>`
    } else {
      logoHTML = `<img src="${openpayLogoPath}/${miniCartSettings.logo}.png"/>`;
    }
    if (cartParent) {
      cartParent.onmouseenter = () => {
        console.log('in');
        setTimeout(() => {
          const cartWidgetExists = document.querySelectorAll('.op-cart-info');
          removeElements(cartWidgetExists)
          const cart_total = document.querySelector(miniCartClasses.totalPrice);
          console.log(cart_total);
          if (cart_total) {
            const cart_value = Number(cart_total.innerText.replace(/[^0-9.-]+/g, ""));
            if (cart_value < min) {
              let add_value = min - cart_value;
              const cartHtml = `${logoHTML}<p>Spend Additional $${add_value} and use Openapy to pay over time interest free.</p>`;
              let divNode = document.createElement('DIV');
              let hrNode = document.createElement('HR');
              divNode.className = 'op-cart-info';
              divNode.innerHTML = cartHtml;
              cartContent.appendChild(divNode)
            } else if (cart_value > max) {
              let reduce_value = cart_value - max;
              const cartHtml = `${logoHTML}<p>Openpay is not available as your cart size is over the maximum limit of ${max}. Please reduce your cart size by ${reduce_value} to use Openpay.</p>`;
              let divNode = document.createElement('DIV');
              let hrNode = document.createElement('HR');
              divNode.className = 'op-cart-info';
              divNode.innerHTML = cartHtml;
              cartContent.appendChild(divNode)
            }
          }
        }, 100)
      };
    }
  }


  // const addChangeListener = () => {
  //   const selectboxes = document.querySelectorAll('select');
  //   for (select of selectboxes) {
  //     select.setAttribute('onclick', 'handleChange();')
  //   }
  // }

  const checkoutMinMax = () => {
    fetch(`https://${middlewareHost}/api/min-max-dummy/`, {
      method: 'POST',
      headers: {
        'Content-type': 'application/json'
      },
      mode: 'cors',
      body: JSON.stringify(authPayload)
    }).then((response) => {
      if (response.ok) {
        return response.json();
      } else {
        throw new Error("Could not reach the API: " + response.statusText);
      }
    }).then((data) => {
      const minPrice = data.MinPrice;
      const maxPrice = data.MaxPrice;
      addCheckoutWidget(minPrice, maxPrice);
    }).catch((error) => {
      console.log(error);
    });
  }

  const addCheckoutWidget = (min, max) => {
    let orderTotal = document.querySelector(checkoutClasses.totalPayment);
    orderTotal = Number(orderTotal.innerText.replace(/[^0-9.-]+/g, ""));
    if (orderTotal > min && orderTotal < max) {
      const checkoutPayload = {
        "token": {
          "JamAuthToken": checkoutSettings.authToken,
          "openpay_url_mode": "Training"
        },
        "purchase_price": orderTotal,
        "duration": checkoutSettings.payOfMonth,
        "payment_frequency": checkoutSettings.frequency
      }
      fetch(`https://${middlewareHost}/api/checkout/`, {
        method: 'POST',
        headers: {
          'Content-type': 'application/json'
        },
        mode: 'cors',
        body: JSON.stringify(checkoutPayload)
      }).then((response) => {
        if (response.ok) {
          return response.json();
        } else {
          throw new Error("Could not reach the API: " + response.statusText);
        }
      }).then((response) => {
        const payments = response.data;
        const openpayCheckoutLabel = document.querySelector(checkoutClasses.paymentLabel);
        const isFractionalPayment = response.fractional_payment;
        openpayCheckoutLabel.style.display = 'inline';
        openpayCheckoutLabel.innerText = 'loading...'
        let opCheckoutMessageFormat = 'op_checkout_text';
        let opCheckoutMessage = '<p class="Checkout__ptag" style="margin-bottom: 0px;">Click on <a href="javascript:void(0);">Submit Order</a> to securely <br>complete your purchase. <br>You will be directed to Openpay website.</p>';
        if (checkoutSettingsExists) {
          opCheckoutMessageFormat = checkoutSettings.checkoutMessageFormat || 'op_checkout_text';
        }
        if (opCheckoutMessageFormat === 'op_checkout_text') {
          opCheckoutMessage = '<p class="Checkout__ptag" style="margin-bottom: 0px;">Click on <a href="javascript:void(0);">Submit Order</a> to securely <br>complete your purchase. <br>You will be directed to Openpay website.</p>';
        }
        if (opCheckoutMessageFormat === 'op_checkout_text_button') {
          opCheckoutMessage = '<p class="Checkout__ptag" style="margin-bottom: 0px;">Click on <a href="javascript:void(0);">Submit Order</a> to securely <br>complete your purchase. <br><a href="javascript:void(0);" class="op__checkoutbtn">Proceed to Openpay</a>';
        }
        if (opCheckoutMessageFormat === 'op_checkout_button') {
          opCheckoutMessage = '<a href="javascript:void(0);" class="op__checkoutbtn">Proceed to Openpay</a>';
        }
        const opPaymentSection = document.querySelector(checkoutClasses.paymentMethod);
        const opPaymentBox = opPaymentSection.querySelector(checkoutClasses.paymentMethodBox);
        const checkoutHtml = `
            </br>
            <div class="all__prices__openpay">
            <div class="checkout_payment_op"></div>
            ${opCheckoutMessage}
          </div>
        `;
        const noOptionHtml = `
            </br>
            <div class="all__prices__openpay">
            <div class="checkout_payment_op"></div>
          </div>
        `;
        if (payments.length > 0) {
          opPaymentBox.innerHTML = checkoutHtml;
        } else {
          opPaymentBox.innerHTML = noOptionHtml;
        }
        var paymentsHtml = '';
        if (payments.length > 0) {
          if (isFractionalPayment) {
            for (payment of payments) {
              paymentsHtml += `
              <div class="price__Tag__Checkout">
                <span>${payment.no_of_payments + 1}</span>
                <div class="priceTagText">
                  <p>${payment.payment_frequency} payments of</p>
                </div>
                <b>$${payment.payment_amount}</b>
              </div>
              <p class="orcheckout__ptag">OR</p>
          `;
            }
          } else {
            paymentsHtml += `<h2 style="text-align:center; padding-bottom: 15px;">Today's payment: $${payments[0].initial_payment}</h2>`
            for (payment of payments) {
              paymentsHtml += `
              <div class="price__Tag__Checkout">
                <span>${payment.no_of_payments}</span>
                <div class="priceTagText">
                  <p>${payment.payment_frequency} payments of</p>
                </div>
                <b>$${payment.payment_amount}</b>
              </div>
              <p class="orcheckout__ptag">OR</p>
          `;
            }
          }
        } else {
          paymentsHtml += `
            <div class="price__Tag__Checkout">
              No Options Available for Given Configurations.
            </div>
        `;
        }
        const checkoutPaymentSection = document.querySelector('.checkout_payment_op');
        checkoutPaymentSection.innerHTML = '';
        checkoutPaymentSection.innerHTML = paymentsHtml;
        const logo = checkoutSettings.logo;
        var logoHTML = ``;
        if (logo === 'op_text_blue') {
          logoHTML = `<div style="display: inline-block; margin-left: 30px; margin-top: 6px; color:#2864ff;">Openpay</div>`
        } else if (logo === 'op_text_black') {
          logoHTML = `<div style="display: inline-block; margin-left: 30px; margin-top: 6px; color:#000000;">Openpay</div>`
        } else {
          logoHTML = `<img src="${openpayLogoPath}/${checkoutSettings.logo}.png" alt="Openpay" style="display: inline-block; margin-left: 30px; margin-top: 6px;">`;
        }
        openpayCheckoutLabel.innerHTML = `Buy Now. Pay Later. ${logoHTML}`;
      }).catch((error) => {
        console.log(error);
      });
    }
  }

  // addChangeListener()
  showNotificationBar(notificationBar);
  checkoutMinMax();

  const checkPriceChange = () => {
    function mutate(mutations) {
      if (mutations) {
        console.log('hi');
        checkoutMinMax();
      }
    }
    var target = document.body;
    console.log(target);
    var observer = new MutationObserver(mutate);
    var config = { characterData: true, attributes: true, childList: false, subtree: false };

    observer.observe(target, config);
  }

  // document.addEventListener('DOMContentLoaded', function () {
  checkPriceChange();
  // }, false);

}

const handleChange = () => {
  // const newPrices = document.querySelectorAll('.price');
  // for (price of newPrices) {

  //   fetch(`https://182.75.72.148:${middlewarePort}/api/min-max-dummy/`, {
  //     method: 'POST',
  //     headers: {
  //       'Content-type': 'application/json'
  //     },
  //     mode: 'cors',
  //     body: JSON.stringify(authPayload)
  //   }).then((response) => {
  //     if (response.ok) {
  //       return response.json();
  //     } else {
  //       throw new Error("Could not reach the API: " + response.statusText);
  //     }
  //   }).then((data) => {
  //     const minPrice = data.MinPrice;
  //     const maxPrice = data.MaxPrice;
  //     addLogoToList(minPrice, maxPrice);
  //   }).catch((error) => {
  //     console.log(error);
  //   });
  // }

  const variations = document.querySelector('.variations');
  variations.addEventListener("click", function () {
    const infoDivExists = document.querySelectorAll('.top-info');
    const removeElementss = (elms) => [...elms].forEach(el => el.remove());
    console.log(infoDivExists);
    removeElementss(infoDivExists)
    activatePlugin();
  });
  // activatePlugin();
}
// activatePlugin();


function rudrSwitchTab(rudr_tab_id, rudr_tab_content) {
  // first of all we get all tab content blocks (I think the best way to get them by class names)
  var x = document.getElementsByClassName("tabcontent");
  var i;
  for (i = 0; i < x.length; i++) {
    x[i].style.display = 'none'; // hide all tab content
  }
  document.getElementById(rudr_tab_content).style.display = 'block'; // display the content of the tab we need

  // now we get all tab menu items by class names (use the next code only if you need to highlight current tab)
  var x = document.getElementsByClassName("tabmenu");
  var i;
  for (i = 0; i < x.length; i++) {
    x[i].className = 'tabmenu';
  }
  document.getElementById(rudr_tab_id).className = 'tabmenu price__actv';
}

// var a = 0;
// const checkTest = () => {
//   console.log('heybaby')
//   document.body.addEventListener('DOMSubtreeModified', function () {
//   }, false);
// }

// checkTest();

// setTimeout(() => {
//   console.log(a)
// }, 1000);
// handleChange();

const checkoutTotalListen = () => {
  console.log('Checkout Total Changed')
};