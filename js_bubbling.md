## Javascript Bubbling in DOM

Bubbling is an event flow mechanism in the DOM where events that are designated as "bubbling" (such as your click event), after being dispatched to their target, follow the target's parent chain upwards, checking for and triggering any event listeners registered on each successive target.

In other words, given a DOM like this:

```html
<div id="foo">
  <div id="bar">
    <a href="/something">Click Target!</a>
  </div>
</div>
```

The click event that is triggered when the anchor is clicked will bubble up through the chain, triggering any click handlers on div#bar and div#foo on the way up.