@extends('layouts.backend')
@section('title','Edit Blog Post')

@section('content')
<div class="container-fluid">
    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-2 mt-2">
        <h1 class="h3 mb-0 text-black-50"></h1>
        <a href="{{url()->previous()}}" class="btn btn-primary float-right">
            <i class="tio-back-ui"></i> Back
        </a>
    </div>


    <!-- Accordion with margin start -->
    <section id="accordion-with-margin">
        <div class="row">
            <div class="col-sm-12">
                <div class="card collapse-icon">
                    <div class="card-header">
                        <div class="d-flex justify-content-between">
                            <h4 class="card-title">{{__('Edit Blog Post')}} </h4>
                        </div>
                    </div>
                    <div class="card-body">
                        <form action="{{ route('admin.blog.update', $blog->id) }}" method="post" id="addPost" enctype="multipart/form-data">
                            @csrf
                            <div class="modal-body">

                                <div class="form-group">
                                    <label for="title">Blog Title</label>
                                    <input type="text" value="{{ $blog->title }}" id="title" class="form-control" required name="title" placeholder="Welcome to scudin">
                                </div>

                                <div class="form-group">
                                    <label for="category">Blog Category</label>
                                    <select name="category" class="form-control" id="category">
                                        <option @if($blog->category == "retail") selected @endif value="retail">Retail</option>
                                        <option @if($blog->category == "ecommerce") selected @endif value="ecommerce">Ecommerce</option>
                                        <option @if($blog->category == "logistics") selected @endif value="logistics">Logistics</option>
                                        <option @if($blog->category == "investor") selected @endif value="investor">Investor Relations</option>
                                        <option @if($blog->category == "others") selected @endif value="others">Other Related Topics</option>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label>Featured Image</label>
                                    <input type="file" class="form-control" name="image" accept="image/*" id="imgInp">
                                    <img id="blah" src="{{ $blog->blog_image }}" style="width: 150px; height:150; margin-top:10px">
                                </div>

                                <div class="form-group">
                                    <label for="excerpt">Blog Excerpt</label>
                                     <input type="text" value="{{ $blog->excerpt }}" id="excerpt" class="form-control form-control-lg" maxlength="255" required name="excerpt" placeholder="Lorem Ipsum dollar sit amet">
                                </div>

                                <div class="form-group">
                                    <label>Blog Content</label>
                                    <textarea class="form-control" name="body" placeholder="Lorem Ipsum dollar sit amet">{{ $blog->body }}</textarea>
                                </div>

                            </div>
                            <div class="modal-footer bg-whitesmoke br">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <button class="btn btn-primary" type="submit">Save</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>

</div>
<script>
imgInp.onchange = evt => {
  const [file] = imgInp.files
  if (file) {
    blah.src = URL.createObjectURL(file)
  }
}
</script>
@endsection