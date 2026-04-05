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

      <div class="container p-5">

        <div class="mb-5">
            <h1 class="mb-2">Edit Character</h1>
            <p class="text-muted">
                Edit any information about the character.
            </p>
          </div>
          
        <form action="/character/update/${character.characterId}" method="post">
      
          <div class="mb-3">
            <label for="name" class="form-label">Character Full Name</label>
            <input 
              type="text" 
              class="form-control" 
              name="name" 
              placeholder="Enter character name"
              required
              value="${character.name}"
            >
          </div>
      
          <div class="mb-2">
            <label class="form-label">Hogwarts House</label>
          </div>
      
          <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="house" id="gryffindor" value="Gryffindor" required
            <#if character.house == "Gryffindor"> checked</#if>
            >
            <label class="form-check-label" for="gryffindor">Gryffindor</label>
          </div>
      
          <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="house" id="slytherin" value="Slytherin"
            <#if character.house == "Slytherin"> checked</#if>
            >
            <label class="form-check-label" for="slytherin">Slytherin</label>
          </div>
      
          <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="house" id="ravenclaw" value="Ravenclaw"
            <#if character.house == "Ravenclaw"> checked</#if>
            >
            <label class="form-check-label" for="ravenclaw">Ravenclaw</label>
          </div>
      
          <div class="form-check form-check-inline mb-4">
            <input class="form-check-input" type="radio" name="house" id="hufflepuff" value="Hufflepuff"
            <#if character.house == "Hufflepuff"> checked</#if>
            >
            <label class="form-check-label" for="hufflepuff">Hufflepuff</label>
          </div>

          <div class="mb-3">
            <label for="bloodStatus" class="form-label">Blood Status</label>
            <select class="form-select text-muted" name="bloodStatus" required>
              <option selected disabled value="">Select</option>
              <option value="Pure-blood" 
                <#if character.bloodStatus == "Pure-blood"> selected</#if>
              >Pure-blood</option>
              <option value="Half-blood"
                <#if character.bloodStatus == "Half-blood"> selected</#if>
              >Half-blood</option>
              <option value="Muggle-born"
              <#if character.bloodStatus == "Muggle-blood"> selected</#if>
              >Muggle-born</option>
              <option value="Squib"
              <#if character.bloodStatus == "Squib"> selected</#if>
              >Squib</option>
            </select>
          </div>          
          
          <div class="mb-4">
            <label for="allegiance" class="form-label">Allegiance / Moral Alignment</label>
            <select class="form-select text-muted" name="allegiance" required>
              <option selected disabled value="">Select</option>
              <option value="Order of the Phoenix"
              <#if character.allegiance == "Order of the Phoenix"> selected</#if>
              >Order of the Phoenix</option>
              <option value="Death Eaters"
              <#if character.allegiance == "Death Eaters"> selected</#if>
              >Death Eaters</option>
              <option value="Ministry of Magic"
              <#if character.allegiance == "Ministry of Magic"> selected</#if>
              >Ministry of Magic</option>
              <option value="Neutral"
              <#if character.allegiance == "Neutral / Other"> selected</#if>
              >Neutral / Other</option>
            </select>
          </div>                
      
          <div class="mb-3">
            <label for="imageUrl" class="form-label">Character Image URL (/images/HarryPotter.png)</label>
            <input 
              type="text" 
              class="form-control" 
              name="imageUrl"
              placeholder="Paste image URL here"
              required
              value="${character.imageUrl!''}"
            >
          </div>

          <div class="mb-4">
            <label>Abilities</label>
            <input required type="text" name="abilities" class="form-control" placeholder="Enter character abilities (Comma Seperated)"
            value="${character.abilities}">
          </div>

          <div class="mb-3">
            <label>Personality Traits</label>
            <input required type="text" name="personalityTraits" class="form-control" placeholder="Enter character personalityTraits (Comma seperated)"
            value="${character.personalityTraits}">
          </div>

          <div class="mb-4">
            <label for="description" class="form-label">Character Summary</label>
            <textarea 
              class="form-control" 
              name="description" 
              rows="4"
              placeholder="Enter a brief character story"
              required
            >${character.description}</textarea>
          </div>
      
          <div class="mb-3">
            <label for="description" class="form-label">Character Backstory</label>
            <textarea 
              class="form-control" 
              name="backStory" 
              rows="4"
              placeholder="Enter a brief character back story"
              required
            >${character.backStory}</textarea>
          </div>
      
          <button type="submit" class="btn btn-primary">
            Update Character
          </button>
      
        </form>
      </div>

      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>    
</body>
</html>