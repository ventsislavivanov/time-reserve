export const userFormRules = ({ user }) => {
    return {
        name: { required: 'Name is required' },
        email: { 
            required: 'Email is required',
            pattern: {
                value: /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$/i,
                message: "Invalid email address"
            }
        },
        phone: { required: 'Phone is required' },
        birth_date: { required: 'Birth date is required' },
        gender: { required: 'Gender is required' },
        role: { required: 'Role is required' },
        password: user 
            ? {} 
            : { 
                required: 'Password is required', 
                minLength: { value: 6, message: 'Min 6 chars' } 
            }
    };
};
