class DateDifferencesCalculator
  dayValue:     null
  monthValue:   null
  yearValue:    null
  date1:        null
  date2:        null

  between:(param1, param2) ->
    date1 = @validateInput(param1)
    date2 = @validateInput(param2)
    return null if !date1 or !date2

    diff = Math.ceil( Math.abs(date2 - date1) / 86400000 )
    return { param1, param2, diff }

  validateInput:(input) ->
    inputArr = input.split(" ")
    return false if inputArr.length != 3

    @dateValue = parseInt(inputArr[0])
    @monthValue = parseInt(inputArr[1])
    @yearValue = parseInt(inputArr[2])

    return false if @dateValue > 31 or @dateValue < 1
    return false if @monthValue > 12 or @monthValue < 1
    return new Date(@yearValue, @monthValue - 1, @dateValue)

window.DateDiff = new DateDifferencesCalculator

# invoke using your console
# DateDiff.between("25 12 2003", "26 11 2013")
