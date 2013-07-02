(function() {
  var DateDifferencesCalculator;

  DateDifferencesCalculator = (function() {
    function DateDifferencesCalculator() {}

    DateDifferencesCalculator.prototype.dayValue = null;

    DateDifferencesCalculator.prototype.monthValue = null;

    DateDifferencesCalculator.prototype.yearValue = null;

    DateDifferencesCalculator.prototype.date1 = null;

    DateDifferencesCalculator.prototype.date2 = null;

    DateDifferencesCalculator.prototype.between = function(param1, param2) {
      var date1, date2, diff;
      date1 = this.validateInput(param1);
      date2 = this.validateInput(param2);
      if (!date1 || !date2) {
        return null;
      }
      diff = Math.ceil(Math.abs(date2 - date1) / 86400000);
      return {
        param1: param1,
        param2: param2,
        diff: diff
      };
    };

    DateDifferencesCalculator.prototype.validateInput = function(input) {
      var inputArr;
      inputArr = input.split(" ");
      if (inputArr.length !== 3) {
        return false;
      }
      this.dateValue = parseInt(inputArr[0]);
      this.monthValue = parseInt(inputArr[1]);
      this.yearValue = parseInt(inputArr[2]);
      if (this.dateValue > 31 || this.dateValue < 1) {
        return false;
      }
      if (this.monthValue > 12 || this.monthValue < 1) {
        return false;
      }
      return new Date(this.yearValue, this.monthValue - 1, this.dateValue);
    };

    return DateDifferencesCalculator;

  })();

  window.DateDiff = new DateDifferencesCalculator;

}).call(this);
