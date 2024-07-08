@include('navBarAdmin')

<div class="admin-student-container">
    <img src="{{ asset('images/imgFondo.jpg') }}" class="background-image" alt="Fondo">

    <div class="form-container">
        <center><h1>Cargar CSV</h1></center>
        
        <form action="{{route('adminCargar.create')}}" method="POST" enctype="multipart/form-data">
            @csrf
            <div class="form-group-only">
                <label for="archivo">Seleccionar archivo CSV:</label>
                <input type="file" id="archivo" name="archivo" accept=".csv">
            </div>

            <center><button type="submit" class="btn">Subir CSV</button></center>
        </form>
    </div>
</div>

<script>
    document.getElementById('uploadForm').addEventListener("submit", async (e) => {
        e.preventDefault();
        let data = new FormData(document.getElementById('uploadForm'));
        try {
            let res = await fetch("http://localhost:8080/uploadfile", {
                method: "POST",
                body: data
            });
            if (res.ok) {
                let response = await res.json();
                if (response.error === "") {
                    alert("Archivo cargado con éxito");
                } else {
                    alert("Error al cargar el archivo: " + response.error);
                }
            } else {
                alert("Error al realizar la solicitud al servidor");
            }
        } catch (error) {
            console.error("Error al procesar la solicitud:", error);
            alert("Error al procesar la solicitud");
        }
    });
</script>
