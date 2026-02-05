import { useEffect, useState } from 'react';
import {
    UIAppForm,
    UIInput,
    UIRadio,
    UIDatePicker,
    UISelect,
    UIModal,
    UIButton
} from '../../../../components/common/ui';
import { useAppForm } from '../../../../hooks';
import { notify } from "../../../../services";
import { createUser, updateUser, updateUserRole } from '../../services/userService.js';
import { getAll as getJobPostions } from '../../../jobs';
import { userFormRules } from '../../validations/userFormRules.js';

const defaultValues = {
    name: '',
    email: '',
    phone: '',
    birth_date: null,
    gender: 'male',
    role: 'worker',
    job_position_id: '',
    password: ''
};

const UserFormModal = ({ user, onSuccess, onCancel }) => {
    const [jobPositions, setJobPositions] = useState([]);

    const methods = useAppForm({
        defaultValues
    });

    const {
        reset,
        watch,
        isLoading
    } = methods;

    const selectedRole = watch('role');

    useEffect(() => {
        const fetchJobPositions = async () => {
            try {
                const data = await getJobPostions();
                setJobPositions(data);
            } catch (error) {
                console.error('Error fetching job positions:', error);
            }
        };
        fetchJobPositions();
    }, []);

    useEffect(() => {
        if (user) {
            const birthDateValue = user.birth_date && user.birth_date !== 'null'
                ? new Date(user.birth_date)
                : null;

            const validBirthDate = birthDateValue instanceof Date && !isNaN(birthDateValue)
                ? birthDateValue
                : null;

            reset({
                name: user.name || '',
                email: user.email || '',
                phone: user.phone || '',
                birth_date: validBirthDate,
                gender: user.gender || 'male',
                role: user.role || 'worker',
                job_position_id: user.job_position_id || '',
                password: ''
            });
        } else {
            reset(defaultValues);
        }
    }, [user, reset]);

    const onSubmit = async (data) => {
        const formattedData = {
            ...data,
            birth_date: data.birth_date
                ? data.birth_date.toISOString().split('T')[0]
                : null
        };

        try {
            if (user) {
                const { role, ...updateData } = formattedData;
                await updateUser(user.id, updateData);

                if (role !== user.role) {
                    await updateUserRole(user.id, role);
                }
            } else {
                await createUser(formattedData);
            }

            onSuccess();
            notify.success('User saved successfully');
        } catch (error) {
            notify.error('Failed to save user');
        }
    };

    const rules = userFormRules({ user });

    const footer = (
        <>
            <UIButton
                variant="secondary"
                data-bs-dismiss="modal"
                isLoading={isLoading}
                onClick={onCancel}
            >
                Cancel
            </UIButton>
            <UIButton
                type="submit"
                form="user-form"
                isLoading={isLoading}
            >
                {user ? 'Update User' : 'Create User'}
            </UIButton>
        </>
    );

    return (
        <UIModal
            id="userFormModal"
            title={user ? 'Edit User' : 'Create New User'}
            icon={user ? 'user-edit' : 'user-plus'}
            size="modal-lg"
            staticBackdrop={true}
            onClose={onCancel}
            footer={footer}
        >
            <UIAppForm methods={methods} onSubmit={onSubmit} id="user-form">
                <div className="row">
                    <div className="col-md-6">
                        <UIInput
                            name="name"
                            label="Full Name"
                            placeholder="John Doe"
                            icon="user"
                            rules={rules.name}
                        />
                    </div>
                    <div className="col-md-6">
                        <UIInput
                            name="email"
                            label="Email Address"
                            type="email"
                            placeholder="john@example.com"
                            icon="envelope"
                            rules={rules.email}
                        />
                    </div>
                    <div className="col-md-6">
                        <UIInput
                            name="phone"
                            label="Phone Number"
                            placeholder="+359..."
                            icon="phone"
                            rules={rules.phone}
                        />
                    </div>
                    <div className="col-md-6">
                        <UIDatePicker
                            name="birth_date"
                            label="Birth Date"
                            placeholder="Select date"
                            rules={rules.birth_date}
                        />
                    </div>
                    <div className="col-md-6">
                        <UIRadio
                            name="gender"
                            label="Gender"
                            options={['male', 'female', 'other']}
                            rules={rules.gender}
                        />
                    </div>
                    <div className="col-md-6">
                        <UIRadio
                            name="role"
                            label="Role"
                            options={['admin', 'worker', 'client']}
                            rules={rules.role}
                        />
                    </div>
                    {selectedRole === 'worker' && (
                        <div className="col-md-6">
                            <UISelect
                                name="job_position_id"
                                label="Job Position"
                                options={jobPositions}
                                icon="briefcase"
                                placeholder="Select position..."
                            />
                        </div>
                    )}
                    <div className="col-md-12 mt-3">
                        <UIInput
                            name="password"
                            label={user ? 'New Password (leave blank to keep current)' : 'Password'}
                            type="password"
                            placeholder="******"
                            icon="lock"
                            rules={rules.password}
                        />
                    </div>
                </div>
            </UIAppForm>
        </UIModal>
    );
};

export default UserFormModal;