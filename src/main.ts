let count: number = 0;

const countDisplay: HTMLElement | null = document.getElementById('count');

function updateDisplay(): void {
    if (countDisplay) {
        countDisplay.textContent = count.toString();
    }
}

function increase(): void {
    count++;
    updateDisplay();
}

function decrease(): void {
    count--;
    updateDisplay();
}

function reset(): void {
    count = 0;
    updateDisplay();
}

window.increase = increase;
window.decrease = decrease;
window.reset = reset;

updateDisplay();
