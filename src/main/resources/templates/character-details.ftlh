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

    <div class="container my-5 text-center">

        <div class="mb-4">
            <img 
                src="${character.imageUrl!'/Images/default.jpg'}" 
                alt="Harry Potter holding a wand"
                class="img-fluid"
                style="max-height: 650px;">
            </div>

            <h1 class="display-4 fw-bold mb-4">${character.name}</h1>
        
            <p><strong>Hogwarts House:</strong>${character.house}</p>
            <p><strong>Blood Status:</strong> ${character.bloodStatus}</p>
            <p><strong>Allegiance:</strong>${character.allegiance}</p>
        
            <div class="mx-auto text-center" style="max-width: 800px;">
        
            <h3 class="mt-4">Backstory</h3>
            <p>
                ${character.backStory}
            </p>
        
            <h3 class="mt-4">Abilities</h3>
            <ul class="list-unstyled">
                <#list character.abilities?split(",") as ability>
                    <Li>${ability?trim}</Li>
                </#list>
            </ul>
        
            <h3 class="mt-4">Personality Traits</h3>
            <ul class="list-unstyled">
                <#list character.personalityTraits?split(",") as traits>
                    <Li>${traits?trim}</Li>
                </#list>
            </ul>
        </div>
        <div class="d-flex justify-content-end">
            <a href="/character/edit/${character.characterId}" class="btn btn-warning me-3">Edit</a>
            <a href="/character/delete/${character.characterId}" class="btn btn-danger">Delete</a>
        </div>  
    </div>     

      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>    
</body>
</html>