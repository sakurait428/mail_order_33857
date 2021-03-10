if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) {
  document.addEventListener('DOMContentLoaded', function(){
    const ImageList = document.getElementById('image-list');
    document.getElementById('message_image').addEventListener('change', function(e){

      const imageContent = document.querySelector('#image');
      if (imageContent){
        imageContent.remove();
      }
      const imageContentDiv = document.querySelector('#image_div');
      if (imageContentDiv){
        imageContentDiv.remove();
      }

      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);

      const imageElement = document.createElement('div');
      const blobImage = document.createElement('img');
      imageElement.setAttribute('id', "image_div")
      blobImage.setAttribute('src', blob);
      blobImage.setAttribute('id', "image");

      imageElement.appendChild(blobImage);
      ImageList.appendChild(imageElement);
    });
  });
}