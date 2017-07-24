
Trix.config.lang =
  bold: "Bold"
  bullets: "Bullets"
  byte:  "Byte"
  bytes: "Bytes"
  captionPlaceholder: "Type a caption here…"
  captionPrompt: "Add a caption…"
  code: "Code"
  heading2: "SubHeading"
  indent: "Increase Level"
  italic: "Italic"
  link: "Link"
  numbers: "Numbers"
  outdent: "Decrease Level"
  quote: "Quote"
  redo: "Redo"
  remove: "Remove"
  strike: "Strikethrough"
  undo: "Undo"
  unlink: "Unlink"
  urlPlaceholder: "Enter a URL…"
  GB: "GB"
  KB: "KB"
  MB: "MB"
  PB: "PB"
  TB: "TB"
  heading: "Heading"
#
# Trix.config.textAttributes =
#   bold:
#     tagName: "strong"
#     inheritable: true
#     parser: (element) ->
#       style = window.getComputedStyle(element)
#       style["fontWeight"] is "bold" or style["fontWeight"] >= 600
#   italic:
#     tagName: "em"
#     inheritable: true
#     parser: (element) ->
#       style = window.getComputedStyle(element)
#       style["fontStyle"] is "italic"
#   href:
#     groupTagName: "a"
#     parser: (element) ->
#       {attachmentSelector} = Trix.AttachmentView
#       matchingSelector = "a:not(#{attachmentSelector})"
#       if link = Trix.findClosestElementFromNode(element, {matchingSelector})
#         link.getAttribute("href")
#   strike:
#     tagName: "del"
#     inheritable: true
#   frozen:
#     style: { "backgroundColor": "highlight" }

Trix.config.blockAttributes = attributes =
  default:
    tagName: "div"
    parse: false
  quote:
    tagName: "blockquote"
    nestable: true
  heading1:
    tagName: "h1"
    terminal: true
    breakOnReturn: true
    group: false
  heading2:
    tagName: "h5"
    terminal: true
    breakOnReturn: true
    group: false
  code:
    tagName: "pre"
    terminal: true
    text:
      plaintext: true
  bulletList:
    tagName: "ul"
    parse: false
  bullet:
    tagName: "li"
    listAttribute: "bulletList"
    group: false
    nestable: true
    test: (element) ->
      Trix.tagName(element.parentNode) is attributes[@listAttribute].tagName
  numberList:
    tagName: "ol"
    parse: false
  number:
    tagName: "li"
    listAttribute: "numberList"
    group: false
    nestable: true
    test: (element) ->
      Trix.tagName(element.parentNode) is attributes[@listAttribute].tagName

{makeFragment} = Trix
{lang} = Trix.config

Trix.config.toolbar =
  content: makeFragment """
    <div class="button_row">
      <span class="button_group text_tools">
        <select id="custom_select">
          <option value="volvo">Volvo</option>
          <option value="saab">Saab</option>
          <option value="mercedes">Mercedes</option>
          <option value="audi">Audi</option>
        </select>
        <button type="button" class="icon bold" data-trix-attribute="bold" data-trix-key="b" title="#{lang.bold}" tabindex="-1">#{lang.bold}</button>
        <button type="button" class="icon italic" data-trix-attribute="italic" data-trix-key="i" title="#{lang.italic}" tabindex="-1">#{lang.italic}</button>
        <button type="button" class="icon strike" data-trix-attribute="strike" title="#{lang.strike}" tabindex="-1">#{lang.strike}</button>
        <button type="button" class="icon link" data-trix-attribute="href" data-trix-action="link" data-trix-key="k" title="#{lang.link}" tabindex="-1">#{lang.link}</button>
        <a href="https://github.com/basecamp/trix/wiki/Configuration", target="_blank">google</a>
      </span>

      <span class="button_group block_tools">
        <button type="button" class="heading"  data-trix-attribute="heading2"  title="#{lang.heading2}">#{lang.heading2}</button>
        <button type="button" class="icon heading-1" data-trix-attribute="heading1" title="#{lang.heading1}" tabindex="-1">#{lang.heading1}</button>
        <button type="button" class="icon quote" data-trix-attribute="quote" title="#{lang.quote}" tabindex="-1">#{lang.quote}</button>
        <button type="button" class="icon code" data-trix-attribute="code" title="#{lang.code}" tabindex="-1">#{lang.code}</button>
        <button type="button" class="icon list bullets" data-trix-attribute="bullet" title="#{lang.bullets}" tabindex="-1">#{lang.bullets}</button>
        <button type="button" class="icon list numbers" data-trix-attribute="number" title="#{lang.numbers}" tabindex="-1">#{lang.numbers}</button>
        <button type="button" class="icon nesting-level decrease" data-trix-action="decreaseNestingLevel" title="#{lang.outdent}" tabindex="-1">#{lang.outdent}</button>
        <button type="button" class="icon nesting-level increase" data-trix-action="increaseNestingLevel" title="#{lang.indent}" tabindex="-1">#{lang.indent}</button>
      </span>
      <span class="button_group history_tools">
        <button type="button" class="icon undo" data-trix-action="undo" data-trix-key="z" title="#{lang.undo}" tabindex="-1">#{lang.undo}</button>
        <button type="button" class="icon redo" data-trix-action="redo" data-trix-key="shift+z" title="#{lang.redo}" tabindex="-1">#{lang.redo}</button>
      </span>
    </div>
    <div class="dialogs">
      <div class="dialog link_dialog" data-trix-attribute="href" data-trix-dialog="href">
        <div class="link_url_fields">
          <input type="url" required name="href" placeholder="#{lang.urlPlaceholder}">
          <div class="button_group">
            <input type="button" value="#{lang.link}" data-trix-method="setAttribute">
            <input type="button" value="#{lang.unlink}" data-trix-method="removeAttribute">
          </div>
        </div>
      </div>
    </div>
  """
