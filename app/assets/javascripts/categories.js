function CategoryHelper (element) {
  this.initialize(element);
}

CategoryHelper.prototype = {
  initialize: function (e) {
    var self = this;

    this.element = e;
    this.formArea = this.element.find("#form-area");
    this.formReady = false;
    this.list = this.element.find("ul");

    this.element.on("ajax:before ajax:success", "h1 a", function (event, data) {
      switch (event.type) {
      case "ajax:before":
        return self.beforeFormLoad();
      case "ajax:success":
        return self.insertForm(data);
      }
    });

    this.element.on("ajax:error ajax:success", "form", function (event, data) {
      switch (event.type) {
      case "ajax:error":
        alert("Sorry, I failed to create a category");
        break
      case "ajax:success":
        self.formArea.hide();
        $(this)[0].reset();
        self.list.append(data);
      }
    });

    this.element.on("ajax:success", "li .delete a", function (event, data) {
      $(this).closest("li").fadeOut();
    });

    this.element.on("click", "form input[name='cancel']", function () {
      self.formArea.hide();
      return false;
    });
  },
  beforeFormLoad: function () {
    if (this.formReady) {
      this.formArea.show();
      return false;
    }
  },
  insertForm: function (data) {
    this.formArea.html(data).show();
    this.formReady = true;
  }
};

$(function () {
  var e = $("#categories");
  if (e) new CategoryHelper(e);
});
