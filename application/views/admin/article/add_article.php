<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header"><?= $title; ?></h1> 
        </div>
        <div class="col-lg-12">
            <form id="add-data" action="<?= base_url('admin/' .$this->url .'/add'); ?>" name="articleForm" method="POST" role="form" enctype="multipart/form-data">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <div class="panel-title pull-right">
                            <button type="button" class="btn btn-warning" onclick="location.href='javascript:window.history.go(-1);'">Cancel</button>
                            <button id="btn-submit" type="submit" class="btn btn-submit"><?= $title; ?> </button>
                        </div>
                         <div class="panel-title pull-left">
                            <button type="button" class="btn btn-language active" data-lang="id">Indonesia</button>
                            <button type="button" class="btn btn-language" data-lang="en">English</button>
                            <button type="button" class="btn btn-language" data-lang="ch">China</button>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-8">
                                <h3>PERSONAL INFORMATION</h3><br />
                                <div class="form-group">
                                    <label>Article Name</label>
                                    <input class="form-control" name="name_article" required="" />
                                </div>
                                <div class="form-group">
                                    <label>Head Name</label>
                                    <input class="form-control" name="head_article" required="" />
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <h3>FLAG</h3><br />
                                <div class='form-group'>
                                    <label for="name_section">Status</label><br />
                                    <input type="radio" class="active-flag" name="flag" value="1" checked="" /><label><span class="green-flag"></span>Active</label><br />
                                    <input type="radio" class="inactive-flag" name="flag" value="2" /><label><span class="red-flag"></span>Inactive</label><br />
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <h3>DESCRIPTION</h3><br />
                                <div class="form-group">
                                    <textarea id="moxEditors" class="ckeditor" name="description"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<script type="text/javascript">
    var data = new Array();
    var key_data = new Array();
    var input = document.getElementsByTagName("input");
    var textarea = (document.getElementById("moxEditors"))?document.getElementById("moxEditors"):"null";
    var btn_language = document.getElementsByClassName("btn-language");
    var lang = $(".btn-language.active")[0].attributes["data-lang"].value;
    var form = $('#add-data');

     // if use ckeditor
    CKEDITOR.replace( 'moxEditors', {} );
    var objEditor = CKEDITOR.instances['moxEditors'];
    objEditor.on('change', function(){
        var obj = {};
        var status_update = false;
        key_data = textarea.getAttribute('name');
        value_data = objEditor.getData();
        obj['lang'] = lang;
        obj[key_data] = value_data;
        if(data.length > 0){
            data.forEach(function(val, key){
                if(val['lang'] == lang){
                    //console.log('update data where lang = ' +lang);
                    data[key][key_data] = value_data;
                    status_update = true;
                }
            });

            if(status_update == false){
                //console.log('add new data')
                data.push(obj);
            }
        }else{
            //console.log('create first data');
            data.push(obj);
        }
        console.log(data);
    });


    for(var i = 0;i < input.length; i++){
        input[i].addEventListener("change", storeData);
    }
        

    for(var i = 0; i < btn_language.length; i++) {
        btn_language[i].addEventListener("click", function(){
            var description = false;
            $(this).parent().find(".active").removeClass("active");
            $(this).addClass("active");
            lang = this.getAttribute("data-lang");
            
            for(var i = 0;i < input.length; i++){
                input[i].value = "";
                //console.log(input[i].getAttribute('name'));
            }
            
            if(data.length > 0){
                data.forEach(function(val, key){
                    // check the data already in the input
                    if(val['lang']==lang){
                        
                        for(key_attribute in data[key]){
                            for(var i = 0;i < input.length; i++){
                                if(input[i].getAttribute('name')==key_attribute){
                                    input[i].value = val[key_attribute];
                                }
                            }
                            if(key_attribute == "description") description=true;
                        }
                        if(description == true){
                            //console.log("true desc");
                            objEditor.setData(val['description']);
                        }
                    }
                });
                if(description == false){
                    //console.log("false desc");
                    objEditor.setData("");   
                }
            }
        });
    }
   
   
    $(form).submit(function(e){
        e.preventDefault();

        if(data.length == 0) throw new Error("data is empty");

        console.log(JSON.stringify(data));
        $.ajax({
            type: "POST",
            url: "<?= base_url('admin/' .$this->url .'/test'); ?>",
            data: {data: JSON.stringify(data)},
            success:function(result){
                console.log(result);
                //window.location="http://www.tutorialspoint.com";
                //location.href = "http://google.com";
            }
        });
    });
    // submit ajax
    /*$("#btn-submit").click(function(e){
        e.preventDefault();
        if(data.length == 0) throw new Error("data is empty");

        console.log(JSON.stringify(data));
        $.ajax({
            type: "POST",
            url: "<?= base_url('admin/' .$this->url .'/test'); ?>",
            //data: {data:JSON.stringify(data)},
            data: {data: JSON.stringify(data)},
            success:function(result){
                //window.location="http://www.tutorialspoint.com";
                console.log(result);
            }
        });
    });*/

    function storeData()
    {
        var obj = {};
        var status_update = false;
        key_data = this.getAttribute("name");
        value_data = this.value;
        obj['lang'] = lang;
        obj[key_data] = value_data;
        if(data.length > 0){
            data.forEach(function(val, key){
                if(val['lang'] == lang){
                    //console.log('update data where lang = ' +lang);
                    data[key][key_data] = value_data;
                    status_update = true;
                }
            });

            if(status_update == false){
                //console.log('add new data')
                data.push(obj);
            }
        }else{
            //console.log('create first data');
            data.push(obj);
        }
        //console.log(data);
    }
    

</script>