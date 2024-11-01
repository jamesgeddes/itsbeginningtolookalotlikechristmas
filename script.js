async function fetchCSVData(url) {
    try {
        const response = await fetch(url);
        if (!response.ok) throw new Error(`HTTP error! Status: ${response.status}`);
        const data = await response.text();

        const lines = data.split('\n').slice(1); // Remove header
        const dates = [];
        const popularity = [];

        lines.forEach(line => {
            const [date, pop] = line.split(',').map(item => item && item.trim()); // Trim and handle empty values
            if (date && pop !== undefined) { // Only push if both date and pop are defined
                dates.push(new Date(date)); // Parse date as Date object
                popularity.push(parseFloat(pop));
            }
        });

        return { dates, popularity };
    } catch (error) {
        console.error("Error fetching CSV data:", error);
    }
}

async function renderChart() {
    const { dates, popularity } = await fetchCSVData('data.csv');

    const ctx = document.getElementById('popularityChart').getContext('2d');
    new Chart(ctx, {
        type: 'line',
        data: {
            labels: dates,
            datasets: [{
                label: 'Popularity of "It\'s Beginning to Look a Lot Like Christmas" over Time',
                data: popularity,
                borderColor: 'red',
                fill: false,
                tension: 0.1
            }]
        },
        options: {
            scales: {
                x: {
                    title: { display: true, text: 'Date' },
                    type: 'time',
                    time: {
                        unit: 'day',
                        tooltipFormat: 'yyyy-MM-dd',
                        displayFormats: {
                            day: 'yyyy-MM-dd'
                        }
                    }
                },
                y: { title: { display: true, text: 'Popularity' } }
            },
        }
    });
}

renderChart();