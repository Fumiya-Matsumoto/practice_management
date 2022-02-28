function flexTextarea(el) {
    const dummy = el.querySelector('.FlexTextarea__dummy')
    el.querySelector('.FlexTextarea__textarea').addEventListener('input', e => {
        dummy.textContent = e.target.value + '\u200b'
    })
}

document.querySelectorAll('.FlexTextarea').forEach(flexTextarea)

document.addEventListener("turbolinks:load", function () {
    $(function(){

        var distance = $('.distance').text
        var switchBtn = $('input[name="post[kind_of_practice]"]');
        var switchItems_jog = $('.switchItems-jog');
        var switchItems_interval = $('.switchItems-interval');
        var switchItems = $('.switchItems');
        var inputField = 'input, textarea';
        switchItems_jog.hide();
        // switchItems_jog.find(inputField).each(function(){
        //     $(this).prop('disabled', true);
        // });


        switchBtn.on('change', function(){

            var inputValue = $(this).val();

            if(inputValue === "ジョグ" || inputValue === "ペース走" || inputValue === "距離走" || inputValue === "ビルドアップ" || inputValue === "レース"){
                $('.distance-text').text('[km]');
                switchItems_jog.hide();
                switchItems_jog.find(inputField).each(function(){
                    $(this).prop('disabled', true);
                });
                switchItems.show();
                switchItems_interval.show();
                switchItems_interval.find(inputField).each(function(){
                    $(this).prop('disabled', false);
                });
            }else if (inputValue === "レスト"){
                switchItems.hide();
            }else{
                $('.distance-text').text('[m]');
                switchItems_interval.hide();
                switchItems_interval.find(inputField).each(function(){
                    $(this).prop('disabled', true);
                });
                switchItems.show();
                switchItems_jog.show();
                switchItems_jog.find(inputField).each(function(){
                    $(this).prop('disabled', false);
                });
            }
        });
    });
});

var i = 0;
$(function(){
    $(".plus").click(function () {
        let clone = $(".result > .clone").clone();
        class_name = "clone" + i.toString();
        i += 1
        clone.addClass(class_name);
        $(".cloned").append(clone);
    });
});

$(function(){
    $(".delete").click(function () {
        $(this).parent().parent().attr("class", "remove_record");
        $(".remove_record").remove();
    });
});
