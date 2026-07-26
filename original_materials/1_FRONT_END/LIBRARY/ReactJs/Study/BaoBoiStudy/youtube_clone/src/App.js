import { BrowserRouter, Routes, Route } from "react-router-dom";
import { Box } from "@mui/material";

import { Navbar } from "./components";

function App() {
  return (
    <BrowserRouter>
      <Box sx={{ backgroundColor: "#0000" }}>
        <Navbar />
      </Box>
    </BrowserRouter>
  );
}

export default App;
