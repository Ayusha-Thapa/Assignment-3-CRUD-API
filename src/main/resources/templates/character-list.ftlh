<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
</head>
<body>
    <nav class="navbar navbar-expand-lg bg-body-tertiary">
        <div class="container-fluid">
          <a class="navbar-brand me-1" href="/characters">
            <img src="/Images/HarryPotter_NavBarLogo.png" alt="Harry Potter Navigation Bar Logo" height="65" width="80">
          </a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="/characters">Home</a>
              </li>
              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                  Characters
                </a>
                <ul class="dropdown-menu">
                    <#list allCharacters as character>
                        <li><a class="dropdown-item" href="/character/${character.characterId}">${character.name}</a></li>
                        <#if character_has_next>
                            <li><hr class="dropdown-divider"></li>
                        </#if>
                    </#list>
                </ul>
              </li>
              <li class="nav-item"></li>
              <a class="nav-link" aria-current="page" href="/character/create">Add Character</a>
            </li>
              <li class="nav-item"></li>
              <a class="nav-link" aria-current="page" href="/about">About Us</a>
            </li>
            </ul>
          </div>
        </div>
    </nav>

      <div class="container my-5 p-5">
        <div class="row align-items-center g-1">
      
          <div class="col-12 col-md-6 text-center">
            <img
              src="/Images/SearchIon_HomePage.png"
              alt="Character search illustration"
              class="img-fluid"
              style="max-width: 250px;"
            />
          </div>
      
          <div class="col-12 col-md-6">
      
            <h2 class="mb-2">Find a Character</h2>
      
            <p class="text-muted mb-4">
              Explore characters from the wizarding world. Search by name, house, or blood status.
            </p>
            
            <form action="/characters/search" method="get" class="d-flex gap-2">
                <input
                id="characterSearch"
                name="name"
                type="text"
                class="form-control shadow-sm"
                placeholder="Search..."
                aria-label="Search characters"
                />
                <button type="submit" class="btn btn-primary">Search</button>
            </form>
            <div class="d-flex flex-wrap gap-2 mt-3">
                <a href="/characters" class="btn btn-outline-dark btn-sm">All</a>
                <a href="/characters/house/Gryffindor" class="btn btn-outline-danger btn-sm">Gryffindor</a>
                <a href="/characters/house/Slytherin" class="btn btn-outline-success btn-sm">Slytherin</a>
                <a href="/characters/house/Ravenclaw" class="btn btn-outline-primary btn-sm">Ravenclaw</a>
                <a href="/characters/house/Hufflepuff" class="btn btn-outline-warning btn-sm">Hufflepuff</a>
            </div>
          </div>
        </div>
      </div>

      <div class="container my-5 p-3">
        
        <div class="row row-cols-1 row-cols-md-3 g-4 mb-4">
            <#list characters as character>
                <div class="col hero-card" data-name="${character.name}" data-tags="gryffindor half-blood">       
                    <div class="card h-100">
                        <img src="${character.imageUrl!'images/default.jpg'}" class="card-img-top" alt="${character.name}">
                        <div class="card-body">
                            <h5 class="card-title">${character.name}</h5>
                            <p class="card-text">
                                ${character.description}
                            </p>
                        </div>
                    </div>
                </div>
            </#list>
        </div>
      
        <!-- <div class="row justify-content-center g-4"></div> -->
      
      </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>    

    <script>
        const searchInput = document.getElementById("characterSearch");
        const cards = document.querySelectorAll(".hero-card");
      
        searchInput.addEventListener("input", function () {
          const query = searchInput.value.trim().toLowerCase();
      
          cards.forEach(card => {
            const name = (card.dataset.name || "").toLowerCase();
            const tags = (card.dataset.tags || "").toLowerCase();
      
            const matches = name.includes(query) || tags.includes(query);
      
            card.style.display = matches ? "" : "none";
          });
        });
      </script>      

</body>
</html>