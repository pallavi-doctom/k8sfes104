import axios from "axios";

const API_URL = "http://localhost:30083/back1/auth";

export const signup = async (username, email, password) => {
  return axios.post(`${API_URL}/signup`, {
    username,
    email,
    password,
  });
};

export const login = async (username, password) => {
  return axios.post(`${API_URL}/login`, {
    username,
    password,
  });
};
