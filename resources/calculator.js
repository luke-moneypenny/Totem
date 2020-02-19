$(document).ready(function () {

    var benefitsHandle = $("#benefitsHandle"),
        pensionHandle = $("#pensionHandle"),
        employeesInput = $('#staffNo'),
        salaryInput = $('#salary'),
        timeInput = $('#time'),
        expensesInput = $('#expenses'),
        niData = "",
        pensionData = "",
        benefitData = "",
        timeData = "",
        total = "",
        isNumber = "";

    $('#staffNo').blur(function(){
        
        isNumber = $('#staffNo').val();

        if (isNaN(isNumber) || isNumber < 0 || isNumber > 9999999) {
            $('#staffError').fadeIn();
            $('#staffNo').addClass('data-form__question__text--error')
        } else {
            $('#staffNo').removeClass('data-form__question__text--error');
            $('#staffError').fadeOut();
            sessionStorage.setItem('employees', employeesInput.val());
        }

        niData = Math.abs(((sessionStorage.getItem('salary') - 8268) * 0.138) * +sessionStorage.getItem('employees')).toFixed(2);
        $('#NI').html(niData.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
        total = Math.abs((((+sessionStorage.getItem('salary')) + (+sessionStorage.getItem('expenses')) + +pensionData + +benefitData + +timeData) * sessionStorage.getItem('employees')) + +niData).toFixed(0);
        $('#finalAmount').html('&#163;' + total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));

    });
    $('#salary').blur(function () {

        isNumber = $('#salary').val();
        

        if (isNaN(isNumber) || isNumber < 0 || isNumber > 9999999) {
            $('#salaryError').fadeIn();
            $('#salary').addClass('data-form__question__text--error')
        } else {
            $('#salary').removeClass('data-form__question__text--error');
            $('#salaryError').fadeOut();
            sessionStorage.setItem('salary', salaryInput.val());
        }

        niData = Math.abs(((sessionStorage.getItem('salary') - 8268) * 0.138) * +sessionStorage.getItem('employees')).toFixed(2);
        total = Math.abs((((+sessionStorage.getItem('salary')) + (+sessionStorage.getItem('expenses')) + +pensionData + +benefitData + +timeData) * sessionStorage.getItem('employees')) + +niData).toFixed(0);
        $('#finalAmount').html('&#163;' + total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
        $('#NI').html(niData.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
    });
    

    $("#pension").slider({
        orientation: "horizontal",
        range: "min",
        min: 0,
        max: 10,
        value: 5,
        step: 0.1,
        slide: function (event, ui) {
            pensionHandle.html([ui.value] + "%");
            slider_value = [ui.value];
            sessionStorage.setItem('pension', slider_value);
            sessionStorage.setItem('niData', niData);
            total = Math.abs(((+sessionStorage.getItem('salary')) + (+sessionStorage.getItem('expenses')) + (+niData / +sessionStorage.getItem('employees')) + ((+sessionStorage.getItem('salary') / 100) * +slider_value) + +benefitData + +timeData) * sessionStorage.getItem('employees')).toFixed(0);
            $('#finalAmount').html('&#163;' + total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
        }
    });

    $("#benefits").slider({
        orientation: "horizontal",
        range: "min",
        min: 0,
        max: 10,
        value: 9,
        step: 0.1,
        slide: function (event, ui) {
            benefitsHandle.html([ui.value] + "%");
            slider_value = [ui.value];
            sessionStorage.setItem('benefits', slider_value);
            pensionData = Math.abs((sessionStorage.getItem('salary') / 100) * (sessionStorage.getItem('pension'))).toFixed(2);
            total = Math.abs(((+sessionStorage.getItem('salary')) + (+sessionStorage.getItem('expenses')) + (+niData / +sessionStorage.getItem('employees')) + +pensionData + ((+sessionStorage.getItem('salary') / 100) * +slider_value) + +timeData) * sessionStorage.getItem('employees')).toFixed(0);
            $('#finalAmount').html('&#163;' + total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
        }
    });

    $('#time').blur(function () {
        benefitData = Math.abs((sessionStorage.getItem('salary') / 100) * (sessionStorage.getItem('benefits'))).toFixed(2),
        isNumber = $('#time').val();

        if (isNaN(isNumber) || isNumber < 0 || isNumber > 9999999) {
            $('#timeError').fadeIn();
            $('#time').addClass('data-form__question__text--error')
        } else {
            $('#time').removeClass('data-form__question__text--error');
            $('#timeError').fadeOut();
            sessionStorage.setItem('time', timeInput.val());
            total = Math.abs(((+sessionStorage.getItem('salary')) + (+sessionStorage.getItem('expenses')) + (+niData / +sessionStorage.getItem('employees')) + +pensionData + +benefitData + ((+sessionStorage.getItem('time') * 30) * 45)) * sessionStorage.getItem('employees')).toFixed(0);
            $('#finalAmount').html('&#163;' + total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
        }
    });

    $('#expenses').blur(function () {
        
        timeData = Math.abs((sessionStorage.getItem('time') * 30) * 45).toFixed(2),
        
        isNumber = $('#expenses').val();

        if (isNaN(isNumber) || isNumber < 0 || isNumber > 9999999) {
            $('#expensesError').fadeIn();
            $('#expenses').addClass('data-form__question__text--error')
        } else {
            $('#expenses').removeClass('data-form__question__text--error');
            $('#expensesError').fadeOut();
            sessionStorage.setItem('expenses', expensesInput.val());
            sessionStorage.setItem('timeData', timeData);
            sessionStorage.setItem('pensionData', pensionData);
            sessionStorage.setItem('benefitData', benefitData);
            sessionStorage.setItem('total', total);
            total = Math.abs(((+sessionStorage.getItem('salary')) + (+sessionStorage.getItem('expenses')) + (+niData / +sessionStorage.getItem('employees')) + +pensionData + +benefitData + +timeData) * sessionStorage.getItem('employees')).toFixed(0),
            $('#finalAmount').html('&#163;' + total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
        }

        
    });


    /*RESULTS SIDE BAR*/
    $.fn.isOnScreen = function () {
        var win = $(window);

        var viewport = {
            top: win.scrollTop(),
            left: win.scrollLeft()
        };
        viewport.right = viewport.left + win.width();
        viewport.bottom = viewport.top + win.height();

        var bounds = this.offset();
        bounds.right = bounds.left + this.outerWidth();
        bounds.bottom = bounds.top + this.outerHeight();

        return !(
            viewport.right < bounds.left ||
            viewport.left > bounds.right ||
            viewport.bottom < bounds.top ||
            viewport.top > bounds.bottom
        );
    };

});