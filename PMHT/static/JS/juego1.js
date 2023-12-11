let matrix = shuffleMatrix();


let board  = document.querySelector(".board");
let startBtn = document.querySelector("#start");
let firstScreen = document.querySelector(".first-screen");
let startBtnContainer = document.querySelector(".startBtn-container");
let counterElement = document.querySelector(".counter");
let counter = 60;
let playerWin = false


//Animacion botones
startBtn.addEventListener('mousedown', ()=>{
    startBtn.style.top = '4px';
})
startBtn.addEventListener('mouseup', ()=>{
    startBtn.style.top = '0px';
})

startBtn.addEventListener('click', ()=>{
    firstScreen.style.display = 'none';
    startBtnContainer.style.display = 'none';
    counterElement.style.display = 'block'
    matrix = shuffleMatrix();

    drawTokens()
    counter = 60;
    playerWin = false
    startCounter()
    addEventListeners()
})

// contador






function drawTokens(){
    board.innerHTML = '';
    matrix.forEach(row => row.forEach(element => {
        if (element == ''){
            board.innerHTML += `<div class="empty">${element}</div
        >`
        }else{
            board.innerHTML += `<div class="token">${element}</div
        >`
        }
        
    }))
}

function addEventListeners(){
    let tokens = document.querySelectorAll('.token');
    tokens.forEach(token => token.addEventListener('click', ()=>{
        let actualPosition = searchPosition(token.innerText)
        let emptyPosition = searchPosition('')
        let movement = canItMove(actualPosition, emptyPosition)

        if (movement !== false){
            updateMatrix(token.innerText, actualPosition, emptyPosition)
            let result = compareMatrix()
            if (result == true){
                playerWin = true
                startBtnContainer.style.display = 'block';
                startBtn.innerText = 'Jugar de nuevo!'

                confetti({
                    particleCount: 150,
                    spread: 150,
                })
            }

            drawTokens()
            addEventListeners()
        }

    }))
}

function searchPosition(element){
    let rowIndex = 0
    let columnIndex = 0
    matrix.forEach((row, index) => {
        let rowElement = row.findIndex(item => item == element)
        if (rowElement !== -1){
            rowIndex = index;
            columnIndex = rowElement;
        }
    })
    return [rowIndex, columnIndex]
}

function canItMove(actualPosition, emptyPosition){
    if (actualPosition[1] == emptyPosition[1]){
        if(actualPosition[0] -emptyPosition[0] > 1 || actualPosition[0]
         -emptyPosition[0] < -1){
            return false
         }
    }else if(actualPosition[0] == emptyPosition[0]){
        if(actualPosition[1] -emptyPosition[1] > 1 || actualPosition[1]
         -emptyPosition[1] < -1){
            return false
         }
    }else{
        return false
    }
}

function updateMatrix(element, actualPosition, emptyPosition){
    matrix[actualPosition[0]][actualPosition[1]] = ''
    matrix[emptyPosition[0]][emptyPosition[1]] = element
}

function shuffleMatrix(){
    let shuffleMatrix = [
        [],
        [],
        []
    ]

    let array = ['1', '2', '3', '4', '5', '6', '7', '8', '']
    // Shuffle the array with a Fisher-Yates shuffle
    for (let i = array.length - 1; i > 0; i--) {
        const j = Math.floor(Math.random() * (i + 1));
        [array[i], array[j]] = [array[j], array[i]];
    }

    let column = 0;
    let row = 0;

    array.forEach(element => {
        shuffleMatrix[row].push(element);
        if (column < 2) {
            column++;
        } else {
            column = 0;
            row++;
        }
    });

    // Ensure the puzzle is solvable
    if (!isSolvable(array)) {
        // If not solvable, swap two tiles (e.g., 1 and 2) to make it solvable
        [shuffleMatrix[0][0], shuffleMatrix[0][1]] = [shuffleMatrix[0][1], shuffleMatrix[0][0]];
    }

    return shuffleMatrix;
}

function isSolvable(puzzle) {
    let inversions = 0;
    const flattenPuzzle = puzzle.flat();

    for (let i = 0; i < flattenPuzzle.length - 1; i++) {
        for (let j = i + 1; j < flattenPuzzle.length; j++) {
            if (flattenPuzzle[i] !== '' && flattenPuzzle[j] !== '' && flattenPuzzle[i] > flattenPuzzle[j]) {
                inversions++;
            }
        }
    }

    // If the number of inversions is even, the puzzle is solvable
    return inversions % 2 === 0;
}

function compareMatrix(){
    let counter = 0;
    let finalMatrix = [
        ['1', '2', '3'],
        ['4', '5', '6'],
        ['7', '8', '']
    ]

    matrix.forEach((row, indexRow) => {
        row.forEach((element, indexcolumn) => {
            if(element == finalMatrix[indexRow][indexcolumn]){
                counter++
            }
        })
    })
    if (counter == 9){
        return true
    }
}

function startCounter(){
    counterElement.innerText = counter;
    let counterId = setInterval(()=>{
        counter--
        if (counter <= 0 ){
            clearInterval(counterId)
            counterElement.style.display = 'none';
            board.innerHTML = '<p class="game-over">Se acabó el tiempo!</p>'
            startBtnContainer.style.display = 'block';
            startBtn.innerText = 'Jugar de nuevo!'
        }else{
            counterElement.innerText = counter;
        }

        if (playerWin == true){
            clearInterval(counterId);
        }

    }, 1000)
}