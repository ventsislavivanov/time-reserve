import { createContext, useCallback, useMemo, useState } from "react";

export const AuthContext = createContext(null);

export function AuthProvider({ children }) {
	const [user, setUser] = useState(null);

	const login = useCallback(({ uid, email, role }) => {
		setUser({ uid, email, role });
	}, []);

	const logout = useCallback(() => {
		setUser(null);
	}, []);

	const value = useMemo(() => ({
		user,
		isAuthenticated: user !== null,
		login,
		logout,
	}), [user, login, logout]);

	return <AuthContext.Provider value={value}>{children}</AuthContext.Provider>;
}
