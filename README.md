# Speed Converter

A **modern Fortran** project using **FPM (Fortran Package Manager)** to convert between **km/h** and **mph**.

> [!NOTE]
> This project was created as my introduction to Fortran.  
> It’s a small but complete example that uses **modern Fortran features**, modular design, and unit testing.

---

## ✨ Features

- 🔄 Convert from **km/h → mph** and **mph → km/h**
- 🖥 Interactive **command-line interface**
- 🧪 Comprehensive **unit tests** for accuracy
- 📦 Structured for **FPM** (Fortran Package Manager)
- ✅ Written with **explicit interfaces** and `implicit none`

---

## 🛠 Prerequisites

- **gfortran** (GNU Fortran compiler)
- **FPM** (*FPM build/run support is in progress – see below for manual build steps*)

---

## 🚀 Building and Running

> [!CAUTION]
> FPM support is being worked on.  
> For now, please build manually with **gfortran**.

### Build and Run (Manual)

```bash
# Build the conversion module
gfortran -c src/convert.f90 -J build

# Build the main application
gfortran -c app/main.f90 -I build
gfortran -o speed-converter convert.o main.o

# Run the application
./speed-converter
```

### Build and Run Tests (Manual)

```bash
# Build tests
gfortran -c test/test_convert.f90 -I build
gfortran -o test_runner convert.o test_convert.o

# Run tests
./test_runner
```

### FPM Commands (Coming Soon)

```bash
# Will be available once FPM setup is complete
# fpm run
# fpm test
# fpm build
```

---

## 📖 Usage

When running the application, enter a **speed value** followed by the **unit**:

```
Enter speed value and unit (e.g., "100 kmh" or "60 mph"): 100 kmh
100.00 km/h = 62.14 mph
```

**Supported units:**
- `kmh` or `km/h` → kilometers per hour
- `mph` → miles per hour

---

## 📂 Project Structure

```
speed-converter/
├── fpm.toml              # FPM configuration
├── src/
│   └── convert.f90       # Conversion functions module
├── app/
│   └── main.f90          # Main application
├── test/
│   └── test_convert.f90  # Unit tests
└── README.md             # This file
```

---

## 📐 Conversion Formula

The project uses the standard factor:  
**1 km/h = 0.621371 mph**

---

## 🧪 Testing

The included tests verify:

- ✅ Conversion accuracy with known values  
- ✅ Edge cases (e.g., zero values)  
- ✅ Round-trip conversions  
- ✅ Reciprocal relationships  

Run tests:

```bash
# Manual method
gfortran -c test/test_convert.f90 -I build
gfortran -o test_runner convert.o test_convert.o
./test_runner

# With FPM (coming soon)
# fpm test
```