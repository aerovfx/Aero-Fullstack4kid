import SideBar from "./SideBar";

const Admin = (props) => {
    return(
        <div className="admin-container">
            <div className="admin-sidebar">
                <SideBar />
            </div>
            <div className="admin-content">
              Admin content
            </div>
           
        </div>
    )
}

export default Admin;