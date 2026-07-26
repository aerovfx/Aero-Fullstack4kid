import Container from 'react-bootstrap/Container';
import Nav from 'react-bootstrap/Nav';
import Navbar from 'react-bootstrap/Navbar';
import NavDropdown from 'react-bootstrap/NavDropdown';
import { NavLink } from 'react-router-dom';

const Header = () => {
  return (

    <Navbar expand="lg" className="bg-body-tertiary">
      <Container>
        <NavLink to="/" className='navbar-brand'>May's store</NavLink> 
        {/* <Navbar.Brand href="#home">May's store</Navbar.Brand> */}
        <Navbar.Toggle aria-controls="basic-navbar-nav" />
        <Navbar.Collapse id="basic-navbar-nav">
          <Nav className="me-auto">
            {/* <Nav.Link href="/">Home</Nav.Link> */}
            {/* <Nav.Link href="/Users">Users</Nav.Link>
            <Nav.Link href="/Admins">Admins</Nav.Link> */}
            <NavLink to="/" className='nav-link'>Home</NavLink> 
            <NavLink to="/Users" className='nav-link'>Users</NavLink> 
            <NavLink to="/Admins" className='nav-link'>Admins</NavLink> 
            
          </Nav>
          <Nav>
            <NavDropdown title="Setting" id="basic-nav-dropdown">
                
                <NavDropdown.Item >
                  Log in
                </NavDropdown.Item>
                <NavDropdown.Item >Log out</NavDropdown.Item>
                <NavDropdown.Divider />
                <NavDropdown.Item >
                  Profile
                </NavDropdown.Item>
              </NavDropdown>

          </Nav>

        </Navbar.Collapse>
      </Container>
    </Navbar>
  );
}

export default Header;