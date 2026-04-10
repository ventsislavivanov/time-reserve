export interface WorkersResponse {
  data: Worker[]
}

export interface Worker {
  id: number;
  name: string;
  job_position: {
    id: number;
    name: string;
  };
  services: {
    id: number;
    name: string;
    price: number;
    duration: number;
  }[];
}
