//lastModified: 1420817434000
//lastModifiedDate: Fri Jan 09 2015 23:30:34 GMT+0800 (台北標準時間)
//name: "2015_01_09_23_30_34.png"
//size: 19797
//type: "image/png"
//webkitRelativePath: ""

function fileUploadCheck() {
    //var $fileupload = $('#ContentPlaceHolder1_UploadPageFileUpload');
    var $fileupload = $('#UploadPageFileUpload');
    
    //debug
    //console.log($fileupload);

    var gotFile;

    // browser not support input type file
    if (!$fileupload[0].files) {
        alert('瀏覽器不支援本網站上傳方式');
    } else if (!$fileupload[0].files[0]) {
        // if select file
        alert('尚未選擇檔案');
    } else {
        // get select file
        gotFile = $fileupload[0].files[0];

        // first check file extension
        var fileType = gotFile.type;
        if (fileType != 'image/png' && fileType != 'image/jpeg' && fileType != 'image/jpg') {
            alert('檔案格式錯誤，需為jpeg、jpg、png檔案格式');
            return;
        }

        // second check file size
        var fileSize = gotFile.size;
        if (fileSize > 40960) {
            alert('檔案大小超過上傳限制，請選擇5MB以下之檔案');
            return;
        }

        // debug
        //alert('檔名：' + gotFile.name + '<br />檔案大小：' + gotFile.size + ' 位元組');

        var imgFileReader = new FileReader();
        var thisImg = new Image();

        imgFileReader.readAsDataURL(gotFile);

        imgFileReader.onload = function (_file) {
            thisImg.src = _file.target.result;

            thisImg.onload = function () {
                if (this.width > 640) {
                    var picWidth = this.width;
                    var picHeight = this.height;
                    // rate for resize
                    var sizeRate = picHeight / picWidth;
                    // new height for pic
                    var newHeight = 640 * sizeRate;
                    // resize pic
                    this.width = 640;
                    this.height = newHeight;
                }
                $('#UploadPageTempPreview').attr('src', this.src);
                $('#UploadPageTempPreview').attr('width', this.width);
                $('#UploadPageTempPreview').attr('height', this.height);
                $('#UploadPageTempPreview').attr('alt', '已有圖片可預覽');
            };
        };

        // change display
        $('#UploadPageTempPreview').removeAttr('hidden');
        $('#BtnUploadPicPageReset').removeAttr('hidden');
        $fileupload.attr('hidden', 'hidden');
    }
}

function UploadPicturePageReset() {
    $('#UploadPageFileUpload')[0].value = '';

    // change display
    $('#UploadPageTempPreview').attr('hidden', 'hidden');
    $('#BtnUploadPicPageReset').attr('hidden', 'hidden');
    $('#UploadPageFileUpload').removeAttr('hidden');
}