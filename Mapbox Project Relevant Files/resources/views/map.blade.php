@extends ('layouts.master')

@section('content')

    <!-- Map display -->
    <div id='map' style='width:100%;height:100%;top:60px'></div>
    <nav class='selection'>
        <div class="subtitle m-b-md">
            Layer Selection
        </div>
        <p>
            Some layers require zooming in to render properly
        </p>
    </nav>

    <div class="navbar">
        <a class='nav' href="{{ route('home') }}">Home</a>
        <a class='nav' href="https://www.mapbox.com/mapbox-gl-js/api/">Mapbox Gl JS Documentation</a>
        <a class='nav' href="https://github.com/atlozada/mapbox-project">GitHub</a>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-switch/3.3.4/js/bootstrap-switch.min.js"></script>
    <script src="js/map.js"></script>

@endsection
