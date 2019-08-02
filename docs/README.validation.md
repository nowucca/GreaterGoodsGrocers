# Validation

here are some notes I made as I researched this topic.

## Build Checkout Page
- Copy the jsp, js files from cart to checkout
- Remove unecessary categories mixin

## Understanding form data binding
- Use v-model not v-bind for input elements on a page
- Test that using the Vue developer extension component view

## HTML options not displaying on page load
- https://stackoverflow.com/questions/52634470/default-selected-value-not-working-in-vue-js
- you need to give initial values to your variables

## JS validation
- You are better off NOT using a [specialized library from google](https://github.com/google/libphonenumber)
- google's library there is over 400k, and is generated code.

- Enter [libphonenumber-js](https://www.npmjs.com/package/libphonenumber-js).
- A bundle is available:  https://github.com/catamphetamine/libphonenumber-js/#cdn
- However, that seems like a heavyweight library with dependencies

- We want a Pure validation library that validates strings: enter: [validator.js](https://github.com/validatorjs/validator.js)
- but then we need to paint the errors ourselves - we can do that in a block easily
- We really want to associate errors with field inputs - we will do so by hand.

After all this I've landed on a solution - we will use validator.js and paint errors ourselves.
validator.js is not the best by any means, but it does have good bones, current updates, 
lots of usage and focuses on string validation only - wonderful.

Handling error painting is left up to the user - for this application, we are going to handle 
errors ourselves.

These links are talking about some standard features in HTML5.
In general these are only relevant for HTML5 formatting.

The following is basic HTML5 and Javascript changes for that:
* (optional) Learn about [Javascript Basic validation API](https://www.w3schools.com/js/js_validation_api.asp)
* (optional) Learn about [Data attributes](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/dataset)

# Turning off Chrome Autofill

Chrome is overly helpful and fills in form values.
This gets in the way of testing.

So, Turning Off Autofill in Chrome:
* Click the Chrome menu icon. (Three lines at top right of screen.)
* Click on Settings.
* Turn off all autofill options in 'Autofill'.

# Validating Individual Fields

Turns out re-validating all fields on blur on not desirable.
We need to simply validate the blurred items.
Otherwise we are filling out the fields and they all turn red after the first field is blurred.


# References

* [Vue Mastery Video on Forms and Validation](https://www.vuemastery.com/courses/intro-to-vue-js/forms/)