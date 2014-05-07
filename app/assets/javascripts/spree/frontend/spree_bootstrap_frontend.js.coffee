$ ->
  $("#search-bar button.dropdown-toggle").html $("#search-select option:selected").text() + " <span class='caret'></span>"
  $("#search-bar .dropdown-menu").on "click", "li a", (event) ->
    event.preventDefault()
    $this = $(this)
    $this.parents("ul").find("a").removeClass "active"
    $this.addClass "active"
    $this.parents(".input-group-btn").find("button").html $this.text() + " <span class='caret'></span>"
    $("#search-select").val $this.data("value")

  $("#search-bar").on "submit", "form", ->
      false  if $.trim($("#keywords").val()) is ""



  # TODO check if product is package based
  # TODO check on pageload
  # TODO REFACTOR
  currency = "€"
  $(".add-to-cart input.ve").on "keyup mouseup", ->
    amountField = $ this
    qmField = $ ".add-to-cart input.qm"
    amount = Math.ceil(amountField.val().replace(",", "."))
    return false if isNaN(amount)
    priceTag = $ "#add-to-cart-button .btn-price"
    paket = if amount > 1 then "Pakete" else "Paket"
    ceiled = if amount != parseFloat(amountField.val()) then "(" + amount + ") " else ""
    amountField.next().text(ceiled + paket) if paket
    qmField.val(("" + (qmField.attr("min") * amount).toFixed(2)).replace(".", ",")) if qmField
    priceTag.text((amount * $(".price.selling").data("price-amount")).toFixed(2).replace(".", ",") + " " + currency)

  # TODO REFACTOR
  $(".add-to-cart input.qm").on "keyup mouseup", ->
    amountField = $(".add-to-cart input.ve")
    qmField = $ this
    priceTag = $ "#add-to-cart-button .btn-price"
    qm = parseFloat(qmField.val().replace(",", "."))
    return false if isNaN(qm)
    amount = Math.ceil(qm / qmField.attr("min"))
    amountField.val("" + amount)
    paket = if amount > 1 then "Pakete" else "Paket"
    amountField.next().text(paket) if paket
    priceTag.text((amount * $(".price.selling").data("price-amount")).toFixed(2).replace(".", ",") + " " + currency)
    realQm = parseFloat((qmField.attr("min") * amount).toFixed(2))
    if qm != realQm then qmField.next().text( "(" + (realQm + "").replace(".", ",") + ") m²") else qmField.next().text("m²")
    #$(".add-to-cart input").first().trigger("keyup")


  # TODO move to carousel extension
  $frame = $ "#ws-accessories .frame"
  $wrap = $frame.parent()

  $frame.sly
    horizontal: 1
    itemNav: 'basic'
    smart: 1
    activateOn: 'click'
    mouseDragging: 1
    touchDragging: 1
    releaseSwing: 1
    elasticBounds: 1
    easing: 'easeOutExpo'
    dragHandle: 1
    dynamicHandle: 1
    clickBar: 1
    scrollBy: 1
    prevPage:  $wrap.find('.prev')
    nextPage:  $wrap.find('.next')




