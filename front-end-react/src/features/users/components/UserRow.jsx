import React from 'react';
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { UIStatusBadge, UIButton, UIRowActions } from "../../../components/common/ui";

const UserRow = ({ user, roleBadgeMap, onToggleActive, onViewDetails, onEdit }) => {
    const actions = [
        {
            key: `edit-${user.id}`,
            icon: "edit",
            variant: "light",
            className: "border shadow-sm rounded-circle p-0",
            style: { width: "32px", height: "32px" },
            iconClassName: "text-warning small",
            title: "Edit User",
            onClick: () => onEdit(user)
        },
        {
            key: `view-${user.id}`,
            icon: "eye",
            variant: "light",
            className: "border shadow-sm rounded-circle p-0",
            style: { width: "32px", height: "32px" },
            iconClassName: "text-primary small",
            title: "View Details",
            onClick: () => onViewDetails(user)
        },
        {
            key: `toggle-${user.id}-${user.is_active}`,
            icon: user.is_active ? "ban" : "check",
            variant: user.is_active ? "outline-danger" : "outline-success",
            className: "shadow-sm rounded-pill px-3",
            label: user.is_active ? "Block" : "Activate",
            iconClassName: user.is_active ? "text-danger small" : "text-success small",
            onClick: () => onToggleActive(user.id)
        }
    ]

    return (
        <tr className={!user.is_active ? "bg-light opacity-75" : ""}>
            <td className="ps-4 py-3">
                <div className="d-flex align-items-center">
                    <div className={`rounded-circle bg-opacity-10 d-flex align-items-center justify-content-center me-3 ${user.is_active ? 'bg-primary text-primary' : 'bg-secondary text-secondary'}`}
                         style={{ width: '38px', height: '38px' }}
                    >
                        <FontAwesomeIcon icon="user" />
                    </div>
                    <div>
                        <div className="fw-bold text-dark">{user.name}</div>
                        <div className="text-muted small">ID: #{user.id}</div>
                    </div>
                </div>
            </td>
            <td className="py-3">
                <div className="d-flex flex-column text-truncate" style={{maxWidth: '200px'}}>
                    <span className="text-dark mb-1">
                        <FontAwesomeIcon icon="envelope" className="me-2 small opacity-50" />
                        {user.email}
                    </span>
                    <span className="text-muted small">
                        <FontAwesomeIcon icon="phone" className="me-2 small opacity-50" />
                        {user.phone}
                    </span>
                </div>
            </td>
            <td className="text-center py-3">
                <span className={`badge ${roleBadgeMap[user.role] || 'bg-secondary'}`}>
                    {user.role}
                </span>
            </td>
            <td className="text-center py-3">
                <div className="d-flex flex-column gap-1 align-items-center">
                    <UIStatusBadge condition={user.is_active} trueText="Active" falseText="Blocked" />
                    <UIStatusBadge condition={user.is_approved} trueText="Approved" falseText="Pending" />
                </div>
            </td>
            <td className="pe-4 text-center py-3">
                <UIRowActions actions={actions} />
            </td>
        </tr>
    );
};

export default UserRow;