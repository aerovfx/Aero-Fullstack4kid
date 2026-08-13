// 1. Đóng gói nhiều thành phần con:
import React, { Fragment } from "react";

function MyComponent() {
  return (
    <Fragment>
      <h1>Title</h1>
      <p>Content</p>
    </Fragment>
  );
}


// 2. Truyền props vào Fragment
import React, { Fragment } from "react";

function MyComponent({ name }) {
  return (
    <Fragment>
      <h1>Hello, {name}!</h1>
      <p>Content</p>
    </Fragment>
  );
}

// 3. Sử dụng Fragment trong một danh sách:
import React, { Fragment } from "react";

function MyListComponent({ items }) {
  return (
    <ul>
      {items.map((item) => (
        <Fragment key={item.id}>
          <li>{item.name}</li>
          <li>{item.description}</li>
        </Fragment>
      ))}
    </ul>
  );
}


// 4. Sử dụng Fragment trong một thành phần điều khiển:
import React, { Fragment } from "react";

function MyControlComponent({ condition }) {
  return (
    <div>
      {condition ? (
        <Fragment>
          <h1>Condition is true</h1>
          <p>Content</p>
        </Fragment>
      ) : (
        <Fragment>
          <h1>Condition is false</h1>
          <p>Content</p>
        </Fragment>
      )}
    </div>
  );
}


// 5. Sử dụng Fragment để tránh thêm thẻ không cần thiết:
import React, { Fragment } from "react";

function MyComponent() {
  return (
    <Fragment>
      <h1>Title</h1>
      <p>Content</p>
    </Fragment>
  );
}
