
function remove_fields(link) {
    $(link).previous("input[type=hidden]").value = "1";
    $(link).up(".fields").hiden();
    $("#art textarea[id^='category_spree_articles_attributes']").each(function(index) {
        $(this).attr('id', 'category_spree_articles_attributes_' + index);
    });
}

function add_fields(link, association, content) {

    var new_id = new Date().getTime();
    var regexp = new RegExp("new_" + association, "g");
    content = content.replace(regexp, new_id);

    $('#art').append(content);

    var ele = new Array();
    $("#art textarea[id^='category_spree_articles_attributes']").each(function(index) {
        $(this).attr('id', 'category_spree_articles_attributes_' + index);
        ele.push('category_spree_articles_attributes_' + index);

    });
    var test = ele[ele.length-1];
    CKEDITOR.replace(test);

}
$(document).ready(function(){
    var ele = new Array();
    $("#art textarea[id^='category_spree_articles_attributes']").each(function(index) {
        $(this).attr('id', 'category_spree_articles_attributes_' + index);
        if (index > 2){
            ele.push('category_spree_articles_attributes_' + index);
            var test = ele[ele.length-1];
            CKEDITOR.replace(test);
        }
    });

});
